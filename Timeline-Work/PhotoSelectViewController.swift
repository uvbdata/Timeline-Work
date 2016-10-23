//
//  PhotoSelectViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 21/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit

class PhotoSelectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate

{
    
    weak var delegate: PhotoSelectViewControllerDelegate?
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var addPostImageOutlet: UIImageView!
    
    @IBAction func selectImageButtonTapped(_ sender: AnyObject) {
        
       // addPostImageOutlet.image = #imageLiteral(resourceName: "NoLogo")
       imagePicker.allowsEditing = false
       imagePicker.sourceType = .photoLibrary
       present(imagePicker, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    // MARK: - UIImagePicker Methods
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            addPostImageOutlet.image = pickedImage
            delegate?.photoSelectViewControllerSelectedImage(image: pickedImage)
        } else {
            print("Picking image is not in correct format")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

protocol PhotoSelectViewControllerDelegate: class {
    func photoSelectViewControllerSelectedImage(image: UIImage?)
}
