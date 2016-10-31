////
////  ViewController.swift
////  ProjectFour
////
////  Created by Daniel Kim on 10/20/16.
////  Copyright © 2016 Daniel Kim. All rights reserved.
////
//
//import UIKit
//
//
//class SearchViewController: UIViewController {
//    
//    var images:[UIImage] = []
//    
//    var recipeChoices:[RecipeChoices] = []
//    
//    //    private let searchChoices:[RecipeChoices] = RecipeChoices.searchChoices
//    
//    var selectedIndex: Int?
//    
//    @IBOutlet weak var foodSearchBar: UISearchBar!
//    
//    @IBAction func searchButton(_ sender: UIButton) {
//        
//        if let url = URL(string:"https://api.edamam.com/search?q="+foodSearchBar.text!+"&app_id=e2513178&app_key=c5fe2bae8f394c5bc0e4ba35ad51aa12") {
//            
//            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//                
//                if error != nil {
//                    
//                    print (error)
//                    
//                } else {
//                    
//                    guard let data = try? Data(contentsOf: url) else {return}
//                    let jsonResult = try? JSONSerialization.jsonObject(with: data
//                        , options: []) as! NSDictionary
//                    let array  = jsonResult?["hits"] as? NSArray
//                    
//                    for i in array! {
//                        
//                    guard let resultingDictionary = i as? NSDictionary,
//                            let recipeDictionary = resultingDictionary ["recipe"] as? NSDictionary,
//                            let result = RecipeChoices.resultingRecipeChoices(dict: recipeDictionary)
//                            else { return }
//                         self.images.append(result.image!)
//                        self.recipeChoices.append(result)
//                        
//                    }
//                    
//                    print(jsonResult)
//                    
//                    
//                }
//            }
//            
//            task.resume()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        
//    }
//    
//    
//}
//
//extension SearchViewController {
//
//    private func segueToChoices(_ selectedIndex:Int) {
//        self.selectedIndex = selectedIndex
//        self.performSegue(withIdentifier: "toChoices", sender: selectedIndex)
//
//    }
//
//    func prepare(for segue: UIStoryboardSegue, sender:AnyObject?) {
//
//        let destination = segue.destination
//        if let recipeChoicesDestination = destination as? CollectionViewController {
//            
//            recipeChoicesDestination.recipeChoices = self.recipeChoices
//
//        }
//    }
//}

