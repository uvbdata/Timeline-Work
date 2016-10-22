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
    
    public let kRecordType = "Comment"
    
    var cloudKitRecordID: CKRecordID?
    var recordType: String {
        return kRecordType
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
    
    /*
    convenience init(comment: Comment) {
        self.init()
        
    }
     */
    
    
}
