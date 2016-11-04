//
//  CameraViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 11/1/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBOutlet weak var picBorder: UIView!
    
    @IBOutlet weak var takePicButton: UIButton!
    
    @IBOutlet weak var uploadButtonOutlet: UIButton!

    
    // Camera
    
    @IBAction func takePictureButton(_ sender: AnyObject) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.camera
        
        picker.allowsEditing = false
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        pictureImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage; dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aesthetics of Images and Buttons
        
        pictureImage.layer.cornerRadius = 10
        
        picBorder.layer.cornerRadius = 10
        
        uploadButtonOutlet.layer.cornerRadius = 5
        
        takePicButton.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
