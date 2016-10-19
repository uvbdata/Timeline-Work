//
//  Comment.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation

class Comment {
    
    var text: String
    var timestamp: NSDate
    var post: Post?
    
    init(text: String, timestamp: NSDate = NSDate(), post: Post?) {
    
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
}
