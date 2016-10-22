//
//  PhotoSelectViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 21/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit

class PhotoSelectViewController: UIViewController {
    
    weak var delegate: PhotoSelectViewControllerDelegate?
    
    @IBOutlet weak var addPostImageOutlet: UIImageView!
    
    @IBAction func selectImageButtonTapped(_ sender: AnyObject) {
        
        addPostImageOutlet.image = #imageLiteral(resourceName: "NoLogo")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

protocol PhotoSelectViewControllerDelegate: class {
    func photoSelectViewControllerSelectedImage() -> UIImage
}
