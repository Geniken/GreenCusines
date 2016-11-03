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
import Async


class RecipeInfoViewController:UIViewController {
    
    var recipe:RecipeChoices?
    
    var recipeChoices:[RecipeChoices] = []
    
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var sourceButton: UIButton!
    
    @IBOutlet weak var shareToFacebookButton: UIButton!
    
    @IBOutlet weak var shareToTwitterButton: UIButton!
    
    @IBOutlet weak var imageBorder: UIView!
    
    @IBOutlet weak var ingredientsLabel: UITextView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    //Share to Facebook
    
    @IBAction func shareToFacebook(_ sender: UIButton) {
        let shareToFacebook:SLComposeViewController = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
        
        self.present(shareToFacebook, animated:true, completion:nil)
    }
    
    //Share to Twitter
    
    @IBAction func shareToTwitter(_ sender: AnyObject) {
        
        let shareToTwitter:SLComposeViewController = SLComposeViewController (forServiceType: SLServiceTypeTwitter)
        
        self.present(shareToTwitter, animated:true, completion:nil)
        
    }
    
    
    @IBAction func recipeSourceButton(_ sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Make Image circular
        recipeImage.layer.borderWidth = 0
        recipeImage.layer.masksToBounds = false
        recipeImage.layer.cornerRadius = recipeImage.frame.height/2
        recipeImage.clipsToBounds = true
        recipeImage.image = recipe?.image
        
        
        // Make Image border circular
        imageBorder.layer.borderWidth = 0
        imageBorder.layer.masksToBounds = false
        imageBorder.layer.cornerRadius = imageBorder.frame.height/2
        imageBorder.clipsToBounds = true
        
        
        //Round the corners of the share/source buttons
        
        sourceButton.layer.cornerRadius = 10
        
        shareToTwitterButton.layer.cornerRadius = 5
        
        shareToFacebookButton.layer.cornerRadius = 5
        
        sourceButton.layer.cornerRadius = 5
        
        //Call Data
        
        guard let recipeView = recipe else {
            
            ingredientsLabel.text = nil
            nameLabel.text = nil
            recipeImage.image = nil
            
            return
        }
        
        
        // ?? means [] if the thing on the left is nil, use the thing on the right
        
        let ingredientsArray = recipe?.ingredients ?? []
        
        let compiledIngredientString = ingredientsArray.joined(separator: ", ")
        
        ingredientsLabel.text = "Ingredients:  \(compiledIngredientString)"
        nameLabel.text = recipeView.recipeName
        recipeImage.image = recipeView.image
        //        recipeView.url = "\(url)"
        
    }
}

//extension RecipeInfoViewController {
//
//    func segueToReceipeInstruction(_ selectedIndex:Int) {
//
//        self.selectedRecipe = selectedRecipe
//
//    }
//
//    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
//
//        let destination = segue.destination
//
//        if let recipeInstructions = destination as? RecipeInstructionsViewController {
//
////            guard let selectedRow =  .indexPathForSelectedRow?.row else {return}
//
//            let recipe = recipeChoices[selectedRecipe]
//
//            recipeInstructions.recipe = recipe
//
//        }
//    }
//}

