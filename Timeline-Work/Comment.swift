//
//  Comment.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation

class Comment: SearchableRecord {
    
    var text: String
    var timestamp: NSDate
    var post: Post?
    
    init(text: String, timestamp: NSDate = NSDate(), post: Post?) {
    
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
    func matchesSearchTerm(searchTerm: String) -> Bool {

        let str = self.text
        guard let _ = str.range(of: searchTerm, options: .caseInsensitive, range: nil, locale: nil) else { return false }
        return true
    }
    
}
