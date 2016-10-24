//
//  PostDetailTableViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

    @IBOutlet weak var postImage: UIImageView!
    var delegate: PostDetailTableViewControllerDelegate? = nil
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = self.post?.photo else { return }
        postImage.image = image
        self.title = post?.comment[0].text
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let myPost = post else { return 0 }
        return myPost.comment.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postDetailCell", for: indexPath)
        
        guard let comment = post?.comment[indexPath.row]
                else { return cell }
        
        cell.textLabel?.text = comment.text
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd mm yyyy"
        
        
        cell.detailTextLabel?.text = dateFormatter.string(from: (comment.timestamp as? Date)!)
        
        return cell

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol PostDetailTableViewControllerDelegate {
    func PostDetailTableVCDidFinished(controller: PostDetailTableViewController)
}
