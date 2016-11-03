//
//  RecipeInstructionsViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 11/2/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit
import Async

class SourceSiteViewController: UIViewController {
    
    var selectedRecipe:Int?
    
    var recipe:RecipeChoices?
    
    var recipeChoice:[RecipeChoices] = []
    
    @IBOutlet weak var recipeInstructionsWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Async.background {
//            
//            var recipeSourceUrl = recipeChoice.
//            
//            let url:NSURL = (string: "recipeSourceUrl")
//            
//            recipeInstructionsWebView.loadRequest(url:URL! as URL)
//            
//        }
    }
    
}


