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

//: ### `caloryValue` - `Dictionary`
//: The calory values per potion of ingredient are stored in a dictionary.
//: At this stage I am not 100% convinced this is the most sustainable way to show this in the app. However, it
//: gives me an opportunity to play with this data structure as this stage.

struct Dish {
    let name: String
    var ingredients: [(ingredient: String, portion: Float)]
    var cuisine: String
    var mealtype: String
    var cost: Float
    var special: Bool?       // ### Assignment 3 - Making at least one property optional
    var dietary: String?     // ### Assignment 3 - Making at least one property optional
    
    // Implemending a method to calculate the calories of the dish - Not bad!!
    func getCalories() -> Float {
        var calories: Float = 0.0
        for ingredient in ingredients {
            if let calorieVal = calorieValue[ingredient.ingredient] {
                calories += ingredient.portion * calorieVal
            }
        }
        return calories
    }
}
//: Let us now implement some of the components for the Dish class to be built later on.
//: **Nice to have** - implementing more than one collection... :]

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

//: ### `mealType` - `Array`
//: In this case we are using this information todifferentiate sections in the menu, such as starters,
//: main dishes, beverages and desserts
let mealType: [String] = ["starter", "main", "dessert", "beverage"]

//: ### `calorieValue` - `Dictionary`
//: The calorie values per potion of ingredient are stored in a dictionary.
//: At this stage I am not 100% convinced this is the most sustainable way to show this in the app. However, it
//: gives me an opportunity to play with this data structure as this stage.
var calorieValue: [String: Float] = [:]
calorieValue["Fusilli"] = 450
calorieValue["Mozarella"] = 400
calorieValue["Pasta Sauce"] = 180
calorieValue["Pizza Base"] = 500
calorieValue["Parmesan"] = 300
calorieValue["Bread"] = 180
calorieValue["Garlic"] = 20
calorieValue["Olives"] = 50
calorieValue["Lemon"] = 100
calorieValue["Sugar"] = 250
calorieValue["Orange"] = 120
calorieValue["Chocolate"] = 200
calorieValue["Mascarpone"] = 450
calorieValue["Cream"] = 250
calorieValue["Coffee"] = 40

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

//: ### Assignment 4 - Create six instances of the `Dish` struct. For 2 of the objects use `nil` for the optionals.
//: For 2 of the objects use `nil` for the optionals. I actually added it to 4 as I implemented 2 optionals:
//: - `fusilliArrabiata`
//: - `pizzaMargherita`
//: - `naranjada`
//: - `garlicBread`

var fusilliArrabiata = Dish(name: "Fusilli Arrabiata",
                            ingredients: [(ingredient: "Fusilli", portion: 2.0),
                                          ("Parmesan", 1.0),
                                          ("Pasta Sauce", 1.0)],
                            cuisine: cuisine[0],
                            mealtype: mealType[1],
                            cost: 15.0,
                            special: true)  // Adding an optional

var pizzaMargherita = Dish(name: "Pizza Margherita",
                           ingredients: [(ingredient: "Pizza Base", portion: 1.0),
                                         ("Mozarella", 2.0),
                                         ("Pasta Sauce", 2.0)],
                        cuisine: cuisine[0],
                        mealtype: mealType[1],
                        cost: 19.0,
                        dietary: diet[0])  // Adding an optional

var lemonade = Dish(name: "Lemonade",
                    ingredients: [(ingredient: "Lemon", portion: 3.0),
                                  ("Sugar", 1.0)],
                    cuisine: cuisine[2],
                    mealtype: mealType[3],
                    cost: 9.0)

var naranjada = Dish(name: "Naranjada",
                        ingredients: [(ingredient: "Orange", portion: 3),
                                      ("Sugar", 0.5)],
                        cuisine: cuisine[1],
                        mealtype: mealType[3],
                        cost: 12.0,
                        special: true)  // Adding an optional

var garlicBread = Dish(name: "Garlic Bread",
                   ingredients: [(ingredient: "Garlic", portion: 1),
                                     ("Parmesan", 2),
                                     ("Bread", 2)],
                        cuisine: cuisine[0],
                        mealtype: mealType[0],
                        cost: 9.0,
                        dietary: diet[0])  // Adding an optional

var tiramisu = Dish(name: "Tiramisu",
                        ingredients: [(ingredient: "Chocolate", portion: 1),
                                     ("Cream", 2),
                                     ("Mascarpone", 2),
                                     ("Coffee",1)],
                        cuisine: cuisine[0],
                        mealtype: mealType[2],
                        cost: 14.0)

//: ### Assignment 5 -  function that takes an object as a parameter & adds the objects you created in Assignment 4 (?) to the collection in created Assignment 2.
//: Use the function created above to add objects to the collection
//:
//: I would have prefered to simply use the `.append` method for my list, but I hope this covers the
//: requirement for this assignment :]
//:

func addToOrder(dish: Dish)-> [Dish] {
    var newOrder: [Dish] = []
    
    newOrder = order + [dish]
    return newOrder           // **Nice to have**: using a `return` statement
}

order = addToOrder(dish: fusilliArrabiata)
order = addToOrder(dish: pizzaMargherita)
order = addToOrder(dish: lemonade)
order = addToOrder(dish: naranjada)
order = addToOrder(dish: garlicBread)
order = addToOrder(dish: tiramisu)
//print(order)

//: ### Assignment 6 -  Create a function that takes a collection as a parameter & prints out all elements of the collection whose optional properties are not nil.
//:
//: I am implementing 2 functions as I have 2 optional objects

func printSpecials(order: [Dish]) {
    for entry in order {
        if let special = entry.special {
            print("===")
            print("Name: \(entry.name)")
            print("Ingredients:")
            for ingredient in entry.ingredients {
                print("- \(ingredient.0)")
            }
            print("Cusine: \(entry.cuisine)")
            print("Meal Type: \(entry.mealtype)")
            print("Cost: \(entry.cost)")
            print("Special: \(special)")
            print("===\n")
        }
    }
}

func printDietaryDishes(order: [Dish]) {
    for entry in order {
        if let dietary = entry.dietary {
            print("===")
            print("Name: \(entry.name)")
            print("Ingredients:")
            for ingredient in entry.ingredients {
                print("- \(ingredient.0)")
            }
            print("Cusine: \(entry.cuisine)")
            print("Meal Type: \(entry.mealtype)")
            print("Cost: \(entry.cost)")
            print("Dietary: \(dietary)")
            print("===\n")
        }
    }
}

printSpecials(order: order)
printDietaryDishes(order: order)

print(fusilliArrabiata.getCalories())

//: [Next](@next)
