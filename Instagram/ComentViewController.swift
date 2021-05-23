import UIKit
import Firebase
import SVProgressHUD



class ComentViewController: UIViewController {
    
//    var postID:String = ""
    var postData: PostData!

    
    
    @IBOutlet weak var inputCommentTextView: UITextField!
    
    //投稿するボタン押下
    @IBAction func comentPost(_ sender: Any) {
        //let postRef = Firestore.firestore().collection(Const.ComentsPath).document()
       

        
        //HUDで投稿処理中に表示を開始
        SVProgressHUD.show()
        
        //HUDで投稿完了に表示する
        SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました。")
        //投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        //コメントを更新する
        var comments = ""
        let commenter = Auth.auth().currentUser?.displayName
        let comment = self.inputCommentTextView.text!
        comments = commenter! + ":" + comment
        
        //コメントの更新データを作成する
        var updateValue: FieldValue
        if comment.isEmpty{
            return
        } else {
            //今回新たにコメントした場合は、コメント入力者とコメント内容を追加する更新データを作成
            updateValue = FieldValue.arrayUnion([comments])
            //コメントに更新データを書き込む
            let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
            postRef.updateData(["comments":updateValue])
        
        
    }
    
    
    
    
    }
        
        

    //戻るボタン押下時
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        SVProgressHUD.dismiss()
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
                }
}

