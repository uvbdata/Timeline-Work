//
//  AddPostTableViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, PhotoSelectViewControllerDelegate {

    var photoPickerImage: UIImage = UIImage()
    
    var delegate: AddPostTableViewControllerDelegate? = nil
    
  
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBOutlet weak var addPostCaptionTextFieldOutlet: UITextField!
    
    @IBAction func addPostButtonTapped(_ sender: AnyObject) {
       
        let myPostImage = self.photoPickerImage 
        let myPostCaption = addPostCaptionTextFieldOutlet.text ?? "New Post"
        
        PostController.sharedController.createPost(image: myPostImage, caption: myPostCaption)

        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

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
    
    func photoSelectViewControllerSelectedImage(image: UIImage?) {
        
        if let pickedImage = image {
            photoPickerImage = pickedImage
            NSLog("Get pickedImage: \(pickedImage.description)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoPickerSegue" {
            let dvc = segue.destination as? PhotoSelectViewController
            dvc?.delegate = self
        }
    }
}

protocol AddPostTableViewControllerDelegate {
    func AddPostTableViewControllerDidFinished(controller: AddPostTableViewController)
}
