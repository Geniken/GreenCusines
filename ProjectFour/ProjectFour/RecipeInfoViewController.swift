//
//  RecipeInfoViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/25/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit

class RecipeInfoViewController:UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImage.layer.borderWidth = 1
        recipeImage.layer.masksToBounds = false
        recipeImage.layer.cornerRadius = recipeImage.frame.height/2
        recipeImage.clipsToBounds = true
        

    }
}
