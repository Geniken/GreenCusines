# GreenThumb-Cuisines

GreenThumb Cuisines is an iOS app that uses the Edamam API to promote users to make healthier dietary choices. It is written in Swift 3. 

# Idea

Finding a healthy way to eat while keeping your palate satisfied is hard as healthy foods or recipes stereotypically seem to be less flavorful than their unhealthier counterparts. GreenThumb Cuisines is able to compile the user a comprehensive list based on the user's search term whether is a recipe or a specific ingredient. 

# Low Fidelity Sketches

I started out by designing the UI and UX flow for my application:

![img_0964](https://cloud.githubusercontent.com/assets/20975504/20114831/c120988e-a5aa-11e6-972f-1f9a7a604ed6.JPG)

# High Fidelity 

![screen shot 2017-05-22 at 8 12 23 pm](https://cloud.githubusercontent.com/assets/20975504/26337141/92b9d58a-3f2b-11e7-8a18-29b6a1a85b53.png)![screen shot 2017-05-22 at 8 12 59 pm](https://cloud.githubusercontent.com/assets/20975504/26337146/997ad464-3f2b-11e7-98b6-3011ded5377a.png)

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


