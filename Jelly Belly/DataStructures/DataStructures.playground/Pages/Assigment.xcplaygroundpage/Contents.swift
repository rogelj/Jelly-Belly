//: [Previous](@previous)
//: ## Week 2 - Assignment

//: ### Assignment 1 - Creating a class or struct
//: We are creating a `Dish` struct to hold dishes that are served at the restaurant.
//:
//: The dish class will comprise:
//:   - name: String
//:   - ingredients: Array of tuples [(item, portion)]
//:   - calories: Float (calculated)
//:   - cusine: String
//:   - mealtype: String
//:   - special: Bool (optional) - Is the dish a special this month?
//:   - dietary: Set (optional) - Dietary restriction
//:   - cost: Float

struct Dish {
    let name: String
    var ingredients: [(item: String, potion: Float)]
    var calories: Float
    var cusine: String
    var mealtype: String
    var special: Bool?       // ### Assignment 3 - Making at least one property optional
    var dietary: String?     // ### Assignment 3 - Making at least one property optional
    var cost: Float
}
//: cost: FloaLet us start with some of the simpler components for the Dish class to be built later on.

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

//: ### `caloryValues` - `Dictionary`
//: The calory values per potion of ingredient are stored in a dictionary.
//: At this stage I am not 100% convinced this is the most sustainable way to show this in the app. However, it
//: gives me an opportunity to play with this data structure as this stage.
var caloryValues: [String: Float] = [:]
caloryValues["Fusilli"] = 450
caloryValues["Mozarella"] = 400
caloryValues["Pasta Sauce"] = 180
caloryValues["Pizza Base"] = 500
caloryValues["Parmesan"] = 300
caloryValues["Bread"] = 180
caloryValues["Garlic"] = 20
caloryValues["Olives"] = 50
caloryValues["Lemon"] = 100
caloryValues["Sugar"] = 250
caloryValues["Orange"] = 120
caloryValues["Chocolate"] = 200
caloryValues["Mascarpone"] = 450
caloryValues["Cream"] = 250
caloryValues["Coffee"] = 40

//: ### `diet` - `Array`
//: The diet array holds information about the type of dietary requirement the meal meets.
//: We are using an optional Array

var diet: [String] = []
diet.append("Vegetarian")
diet.append("Vegan")
diet.append("Kosher")
diet.append("Lactose Free")
diet.append("Gluten Free")


//: ### Assignment 2 - Create an empty collection to hold a group of data from the struct `Dish`
//:
//: An order is a list (Array) of dishes selected by the customer. Initially it is empty
var order: [Dish] = []

//: [Next](@next)
