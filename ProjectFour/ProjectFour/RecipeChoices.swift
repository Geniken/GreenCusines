//
//  RecipeChoices.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/25/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit

struct RecipeChoices {
    
    var recipeName:String?          //label
    var image:UIImage?              //image
    var calories:Int?            //calories
    var url:URL?                    //url
//    var ingredients:[String]?       //ingredientLines
    
    
    
    static func resultingRecipeChoices (dict:NSDictionary) -> RecipeChoices? {
        
        guard let type = dict["image"] as? String,
            let url = URL(string: type),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data),
            let recipeName = dict["label"] as? String,
            let calories = dict["calories"] as? Int
//            let ingredients = dict["ingredientLines"] as? [String]
        
            else {return nil}
        
        return RecipeChoices(recipeName:recipeName, image:image, calories:calories, url:url)
//            , ingredients:ingredients)
        
    }
    
}

