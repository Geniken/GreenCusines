//
//  FBLoginViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 11/1/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FBLoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.current() != nil) {
            
            print ("logged in successful")
            
        } else {
            
            let loginButton = FBSDKLoginButton()
            
            loginButton.center = self.view.center
            
            loginButton.readPermissions = ["public_profile", "email"]
            
            loginButton.delegate = self
            
            self.view.addSubview(loginButton)
            
        }
        
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            
            print (error)
        } else if result.isCancelled {
            
            print ("User cancelled login")
            
        } else {
            
            if result.grantedPermissions.contains("email") {
                
                if let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"]){
                    
                    graphRequest.start(completionHandler: {(connection, result, error) in
                        
                        if error != nil {
                            
                            print (error)
                            
                        } else {
                            
                            if let userDetails = result {
                                
                                print(userDetails)
                            }
                            
                        }
                    })
                }
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        print("Logged out succesfully")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//Prepare for Segue to RecipeInstructions Web View

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

