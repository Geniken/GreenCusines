//
//  RecipeInfo.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/25/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit

struct RecipeInfo {
    
    var name2:[String?]              //label
    var nutrition:[String?]         //totalDaily
    var ingredients:[String?]       //ingredientLines
    
//    static func resultingRecipeInfo (dict:NSDictionary) -> RecipeChoices? {
//        
//        guard let nutrition = dict["totalDaily"] as? [String],
//            let name2 = dict["label"] as? [String],
//            let ingredients = dict["ingredientLines"] as? [String]
//            
//            else { return nil }
//        
//        return RecipeInfo(name2:name2, nutrition:nutrition, ingredients:ingredients)
//    }
}
