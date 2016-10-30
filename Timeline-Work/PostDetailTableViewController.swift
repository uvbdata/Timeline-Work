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
    
    @IBAction func addCommentAction(_ sender: Any) {
        
        var commentTextField: UITextField?
        let alert = UIAlertController(title: "Your comment", message: "Please create your comment for this post.", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "the best comment ever"
            textField.keyboardType = .asciiCapable
            commentTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            return
        }
        
        let commentAction = UIAlertAction(title: "Add Comment", style: .default) { (_) in
            guard let commentText = commentTextField?.text
                else { return }
            PostController.sharedController.createComment(text: commentText, post: self.post)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(commentAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func followPostAction(_ sender: Any) {
    }
    @IBAction func share2ButtonTapped(_ sender: AnyObject) {
        
        let activityViewController = UIActivityViewController(
            activityItems: ["Check out this beer I liked using Beer Tracker.", postImage.image as Any],
            applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func shareButtonTapped(_ sender: AnyObject) {
        
        
        let objectsToShare = ["Share Timeline", postImage.image as Any ] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = []
        self.present(activityVC, animated: true, completion: nil)
        
    }
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.doesRelativeDateFormatting = true
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setToolbarHidden(false, animated: true)
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
        cell.detailTextLabel?.text = dateFormatter.string(from: comment.timestamp  as Date)
        
        
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
