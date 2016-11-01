//
//  SearchTableViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/30/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var images:[UIImage] = []
    var calories:[Double] = []
    
    var selectedImage:String?
    var selectedLabel:String?
    
    var recipeChoices:[RecipeChoices] = []
    
    var selectedIndex: Int?
    
    let main = OperationQueue.main
    
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Search based on keyword
    
    @IBAction func searchButton(_ sender: AnyObject) {
        
        if let url = URL(string:"https://api.edamam.com/search?q="+searchBar.text!+"&app_id=e2513178&app_key=c5fe2bae8f394c5bc0e4ba35ad51aa12") {
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                
                if error != nil {
                    
                    print (error)
                    
                } else {
                    
                    guard let data = try? Data(contentsOf: url) else {return}
                    
                    let jsonResult = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                    
                    let array = jsonResult?["hits"] as? NSArray
                    
                    for i in array! {
                        
                        guard let resultingDictionary = i as? NSDictionary,
                            
                            let recipeDictionary = resultingDictionary ["recipe"] as? NSDictionary,
                            let result = RecipeChoices.resultingRecipeChoices(dict: recipeDictionary)
                            else {return}
                        
                        self.calories.append(result.calories!)
                        self.images.append(result.image!)
                        self.recipeChoices.append(result)
                        
                        
                        // Reload Data
                        
                        DispatchQueue.main.async {
                            self.searchBar.reloadInputViews()
                            self.myTableView.reloadData()
                            
                        }
                        
                    }
                    
                    print (jsonResult)
                    
                }
            }
            
            task.resume()
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchTableViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
//        
//    }
//    
//    func dismissKeyboard() {
//        //Causes the view (or one of its embedded text fields) to resign the first responder status.
//        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    
    //Reusuable Table View Cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell", for: indexPath) as? RecipeChoicesTableViewCell {
            
            guard !recipeChoices.isEmpty else { return UITableViewCell() }
            
            
            let recipeforRow = recipeChoices[indexPath.row]
            
            guard let newData = try? Data (contentsOf:recipeforRow.url!) else {return UITableViewCell () }
            
            guard let imageObject = UIImage(data:newData) else {return UITableViewCell () }
            
            //            guard let nameObject = String(data:newData) else {return
            //                UITableViewCell () }
            
            let calorieObject:String = "\(recipeforRow.calories)"
            
            
            //            cell.nameLabel.text = nameObject
            cell.recipeImage.image = imageObject
            cell.caloriesLabel.text = calorieObject
            
            
            return cell
            
        }
        
        return UITableViewCell()
    }
}

    var valueToPass:UIImageView!

//extension SearchTableViewController {
//    
//    
//    func tableView(tableView:UITableView!, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
//        
//        let indexPath = tableView.indexPathForSelectedRow
//        
//        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
//        
//        valueToPass = (currentCell.imageView?.image)!
//        
//        performSegue(withIdentifier: "toRecipeInfo", sender: self)
//        
//        
//    }
//    
//     func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "toRecipeInfo") {
//            
//            var viewController = segue.destination as! RecipeInfoViewController
//            
//            viewController.recipeImage = valueToPass
//        }
//    }
//}

extension SearchTableViewController {
    
    override func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath) {
        
        let row = (indexPath as NSIndexPath).row
        
        guard row >= 0 && row < recipeChoices.count else {return}
        
        self.segueToReceipeInfo(row)
    }
}


//Prepare for Segue

extension SearchTableViewController {
    
    func segueToReceipeInfo(_ selectedIndex:Int) {
        
        self.selectedIndex = selectedIndex
        self.performSegue(withIdentifier: "toRecipeInfo", sender: selectedIndex)
    }
    
    func prepareForSegue(segue:UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        
        if let recipeInfo = destination as? RecipeInfoViewController, let selectedIndex = sender as? Int {
            
            let recipe = recipeChoices[selectedIndex]
            
            recipeInfo.recipe = recipe
        }
    }
}


// Allow Edit/Delete

func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        
    }
}






