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
    
    // MARK: ___Model functions___
    
    // append new Post to memory and call CloudKit creation func for Post & Comment
    func createPost(image: UIImage, caption: String) {
        
        // create data from image
        let imageData = UIImagePNGRepresentation(image) as NSData?
        
        // create new object post
        let newPost = Post(photoData: imageData, comment: [])
        
        // Update Model
        posts.append(newPost)
        
        // Create new comment
        createComment(text: caption, post: newPost)
       
        // Update comment reference to post object
        if let i = newPost.comment.index(where: { ($0.text == caption && $0.post == nil) }) {
            newPost.comment[i].post = newPost
        }
        
        // create ckpost
        createCKPost(post: newPost) { }
    }
    
    func createComment(text: String, post: Post?) {
        
        // create new Comment for given Post
        guard let getPost = post else { return }
        let newComment = Comment(text: text, post: getPost)
        getPost.comment.append(newComment)
        
        // create ckcomment
        guard let postId = getPost.cloudKitRecordID else { return }
        createCKComment(comment: newComment, postId: postId) { }
        
    }
    
    
    // MARK: ____CloudKit related functions___
    
    
    func createCKPost(post myPost: Post, completion: @escaping () -> Void) {
    
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
