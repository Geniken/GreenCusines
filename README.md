# GreenCuisines

GreenCuisines is an iOS app that uses the Edamam API to help users find recipes to cook at home. It is written in Swift 3. 

# Idea

Finding a healthy way to eat while keeping your palate satisfied is hard as healthy foods or recipes stereotypically seem to be less flavorful than their unhealthier counterparts. GreenCuisines is able to compile the user a comprehensive list based on the user's search term whether is a recipe or a specific ingredient. 

# Low Fidelity Sketches

![img_0964](https://cloud.githubusercontent.com/assets/20975504/20114831/c120988e-a5aa-11e6-972f-1f9a7a604ed6.JPG)

# High Fidelity 

![screen shot 2017-05-22 at 8 12 23 pm](https://cloud.githubusercontent.com/assets/20975504/26337141/92b9d58a-3f2b-11e7-8a18-29b6a1a85b53.png) 

![screen shot 2017-05-22 at 8 12 59 pm](https://cloud.githubusercontent.com/assets/20975504/26337146/997ad464-3f2b-11e7-98b6-3011ded5377a.png)

# Code Example

 @IBAction func searchButton(_ sender: AnyObject) {
        
        SwiftSpinner.show("Loading..")
        
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



# Features

Allows user to search based on any food group or ingredient and have a comprehensive list of recipes populate and allows user to filter their search based on their dietary restrictions ensuring a more fluid and dynamic approach to the search. Coming soon in beta 2.1

Allows user to navigate to a page where they can see the full list of ingredients and also navigate to the source site for the recipe instructions. 



