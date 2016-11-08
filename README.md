# GreenThumb-Cuisines


GreenThumb Cuisines is an iOS app that uses the Edamam API to promote users to make healthier dietary choices. It is written in Swift 3. 

# Idea

Finding a healthy way to eat while keeping your palate satisfied is hard as healthy foods or recipes stereotypically seem to be less flavorful than their unhealthier counterparts. GreenThumb Cuisines is able to compile the user a comprehensive list based on the user's search term whether is a recipe or a specific ingredient. 

# Low Fidelity Sketches

I started out by designing the UI and UX flow for my application:

![img_0964](https://cloud.githubusercontent.com/assets/20975504/20114831/c120988e-a5aa-11e6-972f-1f9a7a604ed6.JPG)

# High Fidelity 

![screen shot 2016-11-03 at 4 30 41 pm](https://cloud.githubusercontent.com/assets/20975504/20114871/edcdc4d8-a5aa-11e6-8fe2-6ebc016c9e2c.png) ![screen shot 2016-11-03 at 4 30 28 pm](https://cloud.githubusercontent.com/assets/20975504/20114876/f15b9b02-a5aa-11e6-844f-440bb66cbe6f.png) ![screen shot 2016-11-03 at 4 31 13 pm](https://cloud.githubusercontent.com/assets/20975504/20114878/f329a9ce-a5aa-11e6-981b-1b9233e701ca.png)

# Code Example

    private func randomImage() -> UIImage {
        let randomBackground = Int(arc4random_uniform(UInt32(randomizedImages.count)))
        
        let randomImageBackground = UIImage(named:randomizedImages[randomBackground])
        
        return randomImageBackground!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let imageView = UIImageView(image: randomImage())
        self.tableView.backgroundView = imageView
        imageView.alpha = 0.8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
    }


# Features

## Search/Filter
Allows user to search based on any food group or ingredient and have a comprehensive list of recipes populate and allows user to filter their search based on their dietary restrictions ensuring a more fluid and dynamic approach to the search. Coming soon in beta 2.1

## Instructions
Allows user to navigate to a page where they can see the full list of ingredients and also navigate to the source site for the recipe instructions. 

## Aesthetics
Added a loading animation for the searchbar, created a random background generator for the initial tableview controller.


