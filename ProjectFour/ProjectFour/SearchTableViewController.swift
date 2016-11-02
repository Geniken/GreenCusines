//
//  SearchTableViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/30/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit
import Async

class SearchTableViewController: UITableViewController {
    
    var refresher:UIRefreshControl!
    
    var images:[UIImage] = []
    var calories:[Int] = []
    var recipeName:[String] = []
//    var ingredients:[String] = String?
    
    var selectedImage:String?
    var selectedLabel:String?
    
    var recipeChoices:[RecipeChoices] = []
    
    var selectedIndex: Int?
    
    private let main = OperationQueue.main
    
    private let async: OperationQueue = {
        
        let operationQueue = OperationQueue()
        
        operationQueue.maxConcurrentOperationCount = 5
        
        return operationQueue
        
    }()
    
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
        
        // Load JSON data asynchronously
        
        Async.background {
            
            if let url = URL(string:"https://api.edamam.com/search?q="+self.searchBar.text!+"&app_id=e2513178&app_key=c5fe2bae8f394c5bc0e4ba35ad51aa12") {
                
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    
                    if error != nil {
                        
                        print (error)
                        
                    } else {
                        
                        guard let data = try? Data(contentsOf: url) else {return}
                        
                        do {
                            let jsonRaw = try JSONSerialization.jsonObject(with: data, options: [])
                            guard let jsonDictionary = jsonRaw as? NSDictionary else {
                                print("DICTIONARY CAST FAILED")
                                return
                            }
                        } catch {
                            print("JSON SERIALIZATION FAILED")
                            return
                        }
                        
                        
                        
                        
                        
                        
                        
                        let jsonResult = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                        
                        let array = jsonResult?["hits"] as? NSArray
                        
                        for recipeJSONEntry in array! {
                            
                            guard let resultingDictionary = recipeJSONEntry as? NSDictionary else { return }
                            guard let recipeDictionary = resultingDictionary ["recipe"] as? NSDictionary else { return }
                            guard let result = RecipeChoices.resultingRecipeChoices(dict: recipeDictionary) else { return }
                            
                            
//                            guard let resultingDictionary = i as? NSDictionary,
//                                let recipeDictionary = resultingDictionary ["recipe"] as? NSDictionary,
//                                let result = RecipeChoices.resultingRecipeChoices(dict: recipeDictionary)
//                                else { return }
                            
//                            self.ingredients.append(result.ingredients!)
                            self.recipeName.append(result.recipeName!)
                            self.calories.append(result.calories!) //guard
                            self.images.append(result.image!)
                            self.recipeChoices.append(result)
                            
                            self.reload()
                            //                            self.recipeChoices.removeAll()
                            
                        }
                        
                        print (jsonResult)
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
        
        //Pull to Refresh
        
        //        refresh()      JUST HAVE TO NAME TABLE DATA PART RELOAD then use self.refresher.endRefreshing() to stop it
        //
        //        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        //
        //        refresher.addTarget(self, action:#selector(SearchTableViewController.refresh), for:UIControlEvents.valueChanged)
        //
        //        tableView.addSubview(refresher)
        
        
        
        //Dismiss Keyboard
        
        //        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchTableViewController.dismissKeyboard))
        //        view.addGestureRecognizer(tap)
        //
        //    }
        //
        //    func dismissKeyboard() {
        //        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        //        view.endEditing(true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Setting TableView background as Image
        
        let backgroundImage = UIImage(named: "background")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
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
    
    
    // Slide in Animation for Images
    
    override func tableView(_ tableView:UITableView, willDisplay cell:UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -300, 10, 0)
        
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 0.5, animations:{ () -> Void in
            
            cell.layer.transform = CATransform3DIdentity
            
        })
    }
    
    
    //Reusuable Table View Cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell", for: indexPath) as? RecipeChoicesTableViewCell {
            
            guard !recipeChoices.isEmpty else { return UITableViewCell() }
            
            
            let recipeforRow = recipeChoices[indexPath.row]

            
            guard let newData = try? Data (contentsOf:recipeforRow.url!) else {return UITableViewCell () }
            guard let imageObject = UIImage(data:newData) else {return UITableViewCell () }
            
            Async.background {
            
            let calorieObject:String = "Calories: \(recipeforRow.calories!)"
            let nameObject:String = "Name: \(recipeforRow.recipeName!)"

                
                cell.nameLabel.text = nameObject
                cell.recipeImage.image = imageObject
                cell.caloriesLabel.text = calorieObject
                
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


