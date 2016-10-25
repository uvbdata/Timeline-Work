//
//  PostController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let sharedController = PostController()
    static let cloudKitManager = CloudKitManager()
    
    var posts = [Post?]()
    
    
    func createPost(image: UIImage, caption: String) {
        
        let imageData = UIImagePNGRepresentation(image) as NSData?
        
        let captionData = Comment(text: caption, post: nil)
        
        let newPost =  Post(photoData: imageData, comment: [captionData])
        posts.append(newPost)
        
    }
    
    func addCommentToPost(text: String, post: Post) {
        
        let newComment = Comment(text: text, post: post)
        for (index, element) in posts.enumerated() {
            print("Item \(index): \(element)")
            if element?.photo != post.photo &&
               element?.timestamp != post.timestamp {
                 print()
            }
                else {
                   self.posts[index]?.comment.append(newComment)
                   return
                }
        }
    }
    
    
}

