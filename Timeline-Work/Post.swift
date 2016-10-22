//
//  Post.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class Post: SearchableRecord, CloudKitSyncable {
    
    
    public let kRecordType = "Post"
    
    var cloudKitRecordID: CKRecordID?
    var recordType: String {
        return kRecordType
    }
    

    var photoData: NSData?
    var timestamp: NSDate
    var comment: [Comment]
    
    var photo: UIImage? {
        guard let image = UIImage(data: photoData as! Data) else { return nil }
        return image
    }
    
    required init?(record: CKRecord) {
        
        
        
    }
    
    
    init(photoData: NSData?, timestamp: NSDate = NSDate(), comment: [Comment]) {
        self.photoData = photoData ?? NSData()
        self.timestamp = timestamp
        self.comment = comment
    }
    
    func matchesSearchTerm(searchTerm: String) -> Bool {
        
        var compare: Bool = false
        for com in comment {
            compare = com.matchesSearchTerm(searchTerm: searchTerm)
            if compare == true {
               return true
            } else {
               continue
            }
        }
        return compare
    }
    
    
    
}

extension CKRecord {
    
    /*
    convenience init?(myPost: Post) {

        // todo
        // self.init()
        
    }
    */

}
