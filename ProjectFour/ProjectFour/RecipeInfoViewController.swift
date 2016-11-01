//
//  RecipeInfoViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/25/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit
import Social

class RecipeInfoViewController:UIViewController {
    
    var recipe:RecipeChoices?
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var sourceButton: UIButton!
    
    @IBOutlet weak var shareToFacebookButton: UIButton!
    
    @IBOutlet weak var shareToTwitterButton: UIButton!
    
    @IBOutlet weak var imageBorder: UIView!
    
    @IBOutlet weak var nutritionLabel: UILabel!
    
    @IBAction func shareToFacebook(_ sender: UIButton) {
        let shareToFacebook:SLComposeViewController = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
        
        self.present(shareToFacebook, animated:true, completion:nil)
    }
    
    @IBAction func shareToTwitter(_ sender: AnyObject) {
        
        let shareToTwitter:SLComposeViewController = SLComposeViewController (forServiceType: SLServiceTypeTwitter)
        
        self.present(shareToTwitter, animated:true, completion:nil)
        
    }
    
    
    @IBAction func recipeSourceButton(_ sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Make Image circular
        recipeImage.layer.borderWidth = 1
        recipeImage.layer.masksToBounds = false
        recipeImage.layer.cornerRadius = recipeImage.frame.height/2
        recipeImage.clipsToBounds = true
        recipeImage.image = recipe?.image
        
        
        // Make Image border circular
        imageBorder.layer.borderWidth = 1
        imageBorder.layer.masksToBounds = false
        imageBorder.layer.cornerRadius = imageBorder.frame.height/2
        imageBorder.clipsToBounds = true
        
        
        //Round the corners of the share/source buttons
        
        shareToTwitterButton.layer.cornerRadius = 5
        
        shareToFacebookButton.layer.cornerRadius = 5
        
        sourceButton.layer.cornerRadius = 5
        
        //Call Data
        
        guard let recipeView = recipe else {
            recipeImage.image = nil
            return
        }
        
        recipeImage.image = recipeView.image
    }
}
