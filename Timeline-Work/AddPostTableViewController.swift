//
//  AddPostTableViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, PhotoSelectViewControllerDelegate {


    
    public var photPickerImage: UIImage = UIImage()
    
    @IBAction func cancelBarButtonItemTapped(_ sender: AnyObject) {
  
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
   
    @IBOutlet weak var addPostCaptionTextFieldOutlet: UITextField!
    
    
    
    
    @IBAction func addPostButtonTapped(_ sender: AnyObject) {
       
        
        /*
        //todo myPostCaption
        var delegateCaption = " Test "
        
        guard let myPostImage = photPickerImage, let myPostCaption = delegateCaption
             else {
                self.fieldErrorAlarm()
                return
        }
    */
    
        let myPostImage = photPickerImage
        let myPostCaption = " Test "
        PostController.sharedController.createPost(image: myPostImage, caption: myPostCaption)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Error Handling
    
    func fieldErrorAlarm() {
        
        let alert = UIAlertController(title: "Post Error", message: "Please select an image and insert a caption!", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Cancel Post", style: .cancel) { (action) in
            
            self.dismiss(animated: true, completion: { 
                return
            })
        }

        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: { (action
            ) in
            return
        })
            
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        
        self.present(alert, animated: true, completion: {
            return
        })
            
        
        
    }
    
    func photoSelectViewControllerSelectedImage() -> UIImage {
        
        // todo ImagePicker and delegate
        let image = UIImage()
        return image
    
    }
    
    
}
