//
//  SearchTableViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/30/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit
import Async
import SwiftSpinner

class SearchTableViewController: UITableViewController {
    
    var refresher:UIRefreshControl!
    
    var images:[UIImage] = []
    var recipeName:[String] = []
    
    var selectedImage:String?
    var selectedLabel:String?
    
    let randomizedImages = ["health","cereal","background"]
    
    var recipeChoices:[RecipeChoices] = []
    
    var selectedIndex: Int?
    
    // Reload Data
    
    func reload () {
        
        Async.main {
            
            self.myTableView.reloadData()
        }
    }
    
    
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Search Based on Keyword
    
    @IBAction func searchButton(_ sender: AnyObject) {
        
        
        SwiftSpinner.show("Loading..")
        
        // Load JSON data asynchronously
        
        Async.background {
            
            if let url = URL(string:"https://api.edamam.com/search?q="+self.searchBar.text!.replacingOccurrences(of: " ", with: "+")+"&app_id=e2513178&app_key=c5fe2bae8f394c5bc0e4ba35ad51aa12") {
                
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    
                    if error != nil {
                        
                        print ("error")
                        
                    } else if (self.searchBar.text?.isEmpty)!{
                        
                        self.recipeChoices.removeAll()
                        SwiftSpinner.hide()
                        self.tableView.reloadData()
                    
                    } else {
                        
                        guard let data = try? Data(contentsOf: url) else {return}
                        
                        do {
                            let jsonRaw = try JSONSerialization.jsonObject(with: data, options: [])
                            guard jsonRaw is NSDictionary else {
                                print("DICTIONARY CAST FAILED")
                                return
                            }
                        } catch {
                            print("JSON SERIALIZATION FAILED")
                            return
                        }
                        
                        let jsonResult = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                        
                        let array = jsonResult?["hits"] as? NSArray
                        
                        self.recipeChoices.removeAll()
                        
                        for recipeJSONEntry in array! {
                            
                            guard let resultingDictionary = recipeJSONEntry as? NSDictionary else { return }
                            guard let recipeDictionary = resultingDictionary ["recipe"] as? NSDictionary else { return }
                            guard let result = RecipeChoices.resultingRecipeChoices(dict: recipeDictionary) else { return }
                        
                            
                            Async.main{
                                
                                self.recipeChoices.append(result)
                                self.reload()
                            }
                            
                            SwiftSpinner.hide()
                        }
                    }
                }
                
                task.resume()
            }
            
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        //Dismiss Keyboard
        
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SearchTableViewController.dismissKeyboard))
        view.addGestureRecognizer(swipe)
        
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
        
        
    }
    
    // Setting TableView background as Random Images
    
    private func randomImage() -> UIImage {
        let randomBackground = Int(arc4random_uniform(UInt32(randomizedImages.count)))
        
        let randomImageBackground = UIImage(named:randomizedImages[randomBackground])
        
        return randomImageBackground!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let imageView = UIImageView(image: randomImage())
        self.tableView.backgroundView = imageView
        imageView.alpha = 0.57
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
    }
    
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipeChoices.count
    }
    
    
    
    //Reusuable Table View Cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell", for: indexPath) as? RecipeChoicesTableViewCell {
            
            guard !recipeChoices.isEmpty else { return UITableViewCell() }
            
            let recipeforRow = recipeChoices[indexPath.row]
            
            
            guard let newData = try? Data (contentsOf:recipeforRow.pic!) else {return UITableViewCell () }
            
            Async.main {

                let imageObject = UIImage(data:newData)
                            
                let nameObject:String = "Name: \(recipeforRow.recipeName!)"
                
                cell.nameLabel.text = nameObject
                cell.recipeImage.image = imageObject
                
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}

// Identify selected row

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
        
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        
        if let recipeInfo = destination as? RecipeInfoViewController {
            
            guard let selectedRow = myTableView.indexPathForSelectedRow?.row else { return }
            
            let recipe = recipeChoices[selectedRow]
            
            recipeInfo.recipe = recipe
        }
    }
}


