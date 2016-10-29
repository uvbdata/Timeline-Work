//
//  Comment.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation
import CloudKit

class Comment: SearchableRecord, CloudKitSyncable {
    
    static let kRecordType = "Comment"
    static let kText = "text"
    static let kTimestamp = "timestamp"
    static let kPost = "post"
    
    
    var cloudKitRecordID: CKRecordID?
  
    var recordType: String {
        return Comment.kRecordType
    }

    
    var text: String
    var timestamp: NSDate
    var post: Post?
    
    init(text: String, timestamp: NSDate = NSDate(), post: Post?) {
    
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
    func matchesSearchTerm(searchTerm: String) -> Bool {
        
        return self.text.lowercased().contains(searchTerm.lowercased())
    }

    
    required init?(record: CKRecord) {
        
        return nil
        
    }
    
}
extension CKRecord {
    
    convenience init?(comment myComment: Comment) {
       
        guard let post = myComment.post else
        {
            NSLog("no post object")
            return nil
        }
     
        self.init(recordType: Comment.kRecordType)
        
        self.setObject(myComment.timestamp as CKRecordValue, forKey: Comment.kTimestamp)
        self.setObject(myComment.text as CKRecordValue?, forKey: Comment.kText)
        self.setObject(myComment.timestamp, forKey: Comment.kTimestamp)
        guard let myCommentPostId = post.cloudKitRecordID else { return }
        let myCommentRef = CKReference(recordID: myCommentPostId, action: .deleteSelf)
        self.setObject(myCommentRef, forKey: Comment.kPost)
        
    }
}


