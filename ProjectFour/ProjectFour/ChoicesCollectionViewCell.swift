//
//  ChoicesCollectionViewCell.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/25/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit

class ChoicesCollectionViewCell: UICollectionViewCell {
    
    var recipeChoiceArray = [RecipeChoices].self
    let searchController = UISearchController(searchResultsController:nil)
    
    
    @IBOutlet weak var recipeChoiceImage: UIImageView!
    
    @IBOutlet weak var calorieNumber: UILabel!
    
    @IBOutlet weak var yieldNumber: UILabel!
    
}
