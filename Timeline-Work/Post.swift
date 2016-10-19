//
//  Post.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    var photoData: NSData?
    var timestamp: NSDate
    var comment: [Comment]
    
    var photo: UIImage? {
        guard let image = UIImage(data: photoData as! Data) else { return nil }
        return image
    }
    
    init(photoData: NSData?, timestamp: NSDate = NSDate(), comment: [Comment]) {
        self.photoData = photoData ?? NSData()
        self.timestamp = timestamp
        self.comment = comment
    }
    
}
