//: [Previous](@previous)
//: ## Week 2 - Assignment

//: ### Assignment 1 - Creating a class or struct
//: We are creating a `Dish` struct to hold dishes that are served at the restaurant.



//: Let us start with some of the simpler components for the Dish class to be built later on.
//: The dish class will comprise:
//:   - name: String
//:   - ingredients: Array
//:   - calories: Float (calculated)
//:   - cusine: String
//:   - mealtype: String
//:   - special: Bool (optional)
//:   - dietary: Set (optional)
//:   - cost: Float


//: ### `cuisine` - `Array`
//: Looking at creating the array for `cuisine`. In this case we use an array as we are simply
//: listing the different types of cuisine available. We can in principle add more.

var cuisine: [String] = []
cuisine.append("Italian")
cuisine.append("Mexican")
cuisine.append("American")
cuisine.append("Japanese")
cuisine.append("Chinese")
cuisine.append("French")

//: ### `mealType` - `Set`
//: In this case we are using a set to differentiate different sections in the menu, such as starters,
//: main dishes, beverages and desserts
let mealType: Set = ["starter", "main", "beverage", "dessert"]

//: ### `ingredients` - `Dictionary`
//: The ingredients are stored in a dictionary that provides information about the calory content.
//: At this stage I am not 100% convinced this is the most sustainable way to show this in the app. However, it
//: gives me an opportunity to play with this data structure as this stage.
var ingredients: [String: Float] = [:]
ingredients["Fusilli"] = 450
ingredients["Mozarella"] = 400
ingredients["Pasta Sauce"] = 180
ingredients["Pizza Base"] = 500
ingredients["Parmesan"] = 300
ingredients["Bread"] = 180
ingredients["Garlic"] = 20
ingredients["Olives"] = 50
ingredients["Lemon"] = 100
ingredients["Sugar"] = 250
ingredients["Orange"] = 120
ingredients["Chocolate"] = 200
ingredients["Mascarpone"] = 450
ingredients["Cream"] = 250
ingredients["Coffee"] = 40

//: ### `diet` - `Array`
//: The diet array holds information about the type of dietary requirement the meal meets.
//: We are using an optional Array

var diet: [String] = []
diet.append("Vegetarian")
diet.append("Vegan")
diet.append("Kosher")
diet.append("Lactose Free")
diet.append("Gluten Free")


//: [Next](@next)
