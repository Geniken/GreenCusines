//
//  RecipeChoicesTableViewCell.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/30/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit

class RecipeChoicesTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
//    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var borderViewOutlet: UIView!
    
    @IBOutlet weak var recipeImageOutlet: UIImageView!
    
    @IBOutlet weak var caloriesLabelOutlet: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
