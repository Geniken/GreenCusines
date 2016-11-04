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
    
    var recipeInfo:RecipeChoices?
    
    var recipeChoice:[RecipeChoices] = []
    
    @IBOutlet weak var recipeInstructionsWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Async.background {

            guard let recipeSourceUrl = self.recipeInfo?.sourceUrl else {return}
            
            print("the recipe is: \(recipeSourceUrl)")
            
            let sourceURL = URL(string: recipeSourceUrl)
            let request = URLRequest(url: sourceURL!)
            
            self.recipeInstructionsWebView.loadRequest(request)
        }
    }
}


