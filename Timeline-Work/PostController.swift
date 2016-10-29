//
//  PostController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class PostController {
    
    static let sharedController = PostController()
    static let cloudKitManager = CloudKitManager()
    
    var posts = [Post?]()
    
    // append new Post to memory and call CloudKit creation func for Post & Comment
    func createPost(image: UIImage, caption: String) {
        
        // create data from image
        let imageData = UIImagePNGRepresentation(image) as NSData?
        
        // create new objects post and command
        let newComment = Comment(text: caption, post: nil)
        let newPost = Post(photoData: imageData, comment: [newComment])
        
        posts.append(newPost)
        
        // Update Comment with post object
        if let i = newPost.comment.index(where: { ($0.text == caption && $0.post == nil) }) {
            newPost.comment[i].post = newPost
        }
        
        createCKPost(post: newPost, comment: newComment) {
            
        }
        
    }
    
    func createCKPost(post myPost: Post, comment myComment: Comment, completion: @escaping ( ) -> Void) {
    
        let newPostRecord = CKRecord(post: myPost)
        PostController.cloudKitManager.saveRecord(newPostRecord) { (record, error) in
            guard let record = record else {
                if let error = error {
                    NSLog("Error saving new post to CloudKit: \(error)")
                    return
                }
                return
            }
            myPost.cloudKitRecordID = record.recordID
            self.createCKComment(comment: myComment, postId: myPost.cloudKitRecordID!, completion: {
                 
            })
        }
    }
    
    
    func createCKComment(comment myComment: Comment, postId: CKRecordID, completion: @escaping () -> Void) {
            
            guard let newCommentRecord = CKRecord(comment: myComment) else { return }
            PostController.cloudKitManager.saveRecord(newCommentRecord) { (record, error) in
                guard let record = record else {
                    if let error = error {
                        NSLog("Error saving new comment to CloudKit: \(error)")
                        return
                    }
                    return
                }
                myComment.cloudKitRecordID = record.recordID
            }
    }
}
