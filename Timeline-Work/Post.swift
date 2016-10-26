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

class Post: SearchableRecord {
    
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
    
    var photo2data: NSData? {
        guard let myPhoto = photo else { return nil }
        guard let imageData: NSData = UIImageJPEGRepresentation(myPhoto, .greatestFiniteMagnitude) as NSData? else { return nil }
        return imageData
    }
    
    private var temporaryPhotoURL: URL {
        let temporaryDirectory = NSTemporaryDirectory()
        
        let temporaryDirectoryURL = URL(fileURLWithPath: temporaryDirectory)
        
        let fileURL = temporaryDirectoryURL.appendingPathComponent(NSUUID().uuidString).appendingPathExtension("jpg")
        
        photoData?.write(to: fileURL, atomically: true)
        return fileURL
    }
    
    
    init(photoData: NSData?, timestamp: NSDate = NSDate(), comment: [Comment]) {
        self.photoData = photoData ?? NSData()
        self.timestamp = timestamp
        self.comment = comment
    }
    
    func matchesSearchTerm(searchTerm: String) -> Bool {

        let match = comment.filter { com in
            com.text.lowercased().contains(searchTerm.lowercased())
        }
        if match.count == 0 {
            return false
        } else {
            return true
        }
    }
}

extension CKRecord {
    
    convenience init?(myPost: Post, myTimestamp: NSDate, myAssetData: NSData) {
    
        
        self.init(recordType: myPost.kRecordType)
        setObject(myTimestamp, forKey: "timestamp")
        //photoData = myAssetData
        //setObject(self.photo2Data(myAsset), forKey: "image")
    }
}
