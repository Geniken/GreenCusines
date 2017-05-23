//
//  RecipeChoicesTableViewCell.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/30/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit

class RecipeChoicesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeImageOutlet: UIImageView!
    
    @IBOutlet weak var labelBorder: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recipeImage.layer.cornerRadius = 5
        labelBorder.layer.cornerRadius = 5
    }
    
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
