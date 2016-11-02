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
    
    var name:String?               //label
    var image:UIImage?             //image
    var calories:Double?           //calories
    var url:URL?                   //url

    
    
    
    static func resultingRecipeChoices (dict:NSDictionary) -> RecipeChoices? {
        
        guard let type = dict["image"] as? String,
            let url = URL(string: type),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data),
            let name = dict["label"] as? String,
            let calories = dict["calories"] as? Double
            
            else {return nil}
        
        return RecipeChoices(name:name, image:image, calories:calories, url:url)
        
    }
    
}

