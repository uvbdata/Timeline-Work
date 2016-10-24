//
//  PostTableViewCell.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var timelineWorkCaptionOutlet: UILabel!
    @IBOutlet weak var timelineWorkImageOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithPost(post: Post, index: IndexPath) {
        
        let post = PostController.sharedController.posts[index.row]
        timelineWorkImageOutlet.image = post?.photo
        timelineWorkCaptionOutlet.text = post?.comment[0].text
    }

}

