import UIKit
import Firebase

class CommentData: NSObject {
  
    var coment: String?
    var postID: String?
    var user: String?

    
    init(document: QueryDocumentSnapshot) {
        
        let postDic = document.data()
        
        self.user = postDic["user"] as? String
        
        self.coment = postDic["coment"] as? String
        
        self.postID = postDic["postID"] as? String
        
    }
}
