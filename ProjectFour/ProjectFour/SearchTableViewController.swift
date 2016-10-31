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
    
    var recipeChoices:[RecipeChoices] = []
    
    var selectedIndex: Int?
    
    let main = OperationQueue.main
    
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
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
                        
                        self.images.append(result.image!)
                        self.recipeChoices.append(result)
                        
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
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell", for: indexPath) as? RecipeChoicesTableViewCell {
            
            guard !recipeChoices.isEmpty else { return UITableViewCell() }
            
            let recipeforRow = recipeChoices[indexPath.row]
            
            guard let newData = try? Data (contentsOf:recipeforRow.url!) else {return UITableViewCell () }
            
            guard let imageObject = UIImage(data:newData) else {return UITableViewCell () }
            
            
            cell.recipeImage.image = imageObject
//            cell.caloriesLabel. = recipeforRow.calories
            
            

        return cell
            
        }
        
        return UITableViewCell()
    }
    
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
