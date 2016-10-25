//
//  ViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/20/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchButtonOulet: UIButton!
    
    @IBOutlet weak var foodSearchBar: UISearchBar!
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        if let url = URL(string:"https://api.edamam.com/search?q="+foodSearchBar.text!+"&app_id=e2513178&app_key=c5fe2bae8f394c5bc0e4ba35ad51aa12") {
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                
                if error != nil {
                    
                    print (error)
                    
                } else {
                    
                    if let urlContent = data {
                        
                        do {
                            
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                            
                            print(jsonResult)
                            
                        } catch {
                            
                            print ("JSON failed")
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
    
