//
//  DataStructures.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/08/2022.
//

import Foundation
import UIKit

/**
 `Ingredients` struct to hold an ingredient and the portion used for a dish

 The dish class will comprise:
    - `ingredient: String`
    - `portion`: `Double`
*/
struct Ingredients {
    var ingredient: String
    var portion: Double
}

/**
 `Dish` class to hold dishes that are served at the restaurant.

 The dish class will comprise:
    - `name: String`
    - `ingredients`: `Array` of `Ingredients`
    - `cusine: String`
    - `mealType: String`
    - `special: Bool?` (optional) - Is the dish a special this month?
    - `dietary: String?` (optional) - Dietary restriction
    - `cost: Double`
    - `discountable: Bool?` (optional) - can the dish be discounted?
    - `discountFactor: Double` - Lazy property
    - `finalCost: Double` - Computed property - based on the discountFactor (if dish is discountable)
 
*/
class Dish {
    let id = UUID()
    let name: String
    var ingredients: [Ingredients]
    var cuisine: String
    var mealType: (String, String)
    var cost: Double
    var special: Bool?
    var dietary: String?
    var discountable: Bool?
    
    // Implementing a lazy property to get the level of discount for the season
    lazy var discountFactor: Double = Constants.General.currentSeason.rawValue
    
    // Implementing a computed property to get the level of discount for the season
    var finalCost: Double {
//        mutating get {
            var result: Double = cost
            if let discountable = discountable {
                if discountable {
                    result = cost * (1 - discountFactor)
                }
            }
            return result
//        }
    }
    
    init(name: String, ingredients: [Ingredients], cuisine: String, mealType: (String, String),
         cost: Double, special: Bool? = nil, dietary: String? = nil, discountable: Bool? = nil) {
        self.name = name
        self.ingredients = ingredients
        self.cuisine = cuisine
        self.mealType = mealType
        self.cost = cost
        self.special = special
        self.dietary = dietary
        self.discountable = discountable
    }

    // Implementing a method to calculate the calories of the dish - Not bad!!
    /**
    It calculates the calorie content of a `Dish` object

    It relies on the `calorieValue` dictionary and the portions used to make the dish.

     - Parameters:
         - none:

     - Returns: Calorie content of a dish

    */
    func getCalories() -> Double {
        var calories: Double = 0.0
        for ingredient in ingredients {
            if let calorieVal = DishParts.calorieValue[ingredient.ingredient] {
                calories += ingredient.portion * calorieVal
            }
        }
        return calories.roundNearest()  // **Nice to have** - implementing a method with `return`
    }
}

struct Order {
    var order: [Dish] = []

    init(loadTestData: Bool = false) {
        if loadTestData {
            // Loading test data - now stored in `Dishes.swift`
            order = dishes
        }
    }

    /**
    Adds a `dish` to the order

     - Parameters:
         - dish: a`Dish` object

     - Returns: Adds the `dish` to the existing order

    */
    mutating func addToOrder(dish: Dish) {
        order.append(dish)
    }

    /**
    Prints the dishes that are marked as `special` in an order

     - Parameters:
         - order: an Array of `Dish` objects

     - Returns: Prints to the console

    */
    mutating func printSpecials() {
        for entry in order {
            if let special = entry.special {
                Swift.print("===")
                Swift.print("Name: \(entry.name)")
                Swift.print("Ingredients:")
                for ingredient in entry.ingredients {
                    Swift.print("- \(ingredient.ingredient)")
                }
                Swift.print("Cusine: \(entry.cuisine)")
                Swift.print("Meal Type: \(entry.mealType)")
                Swift.print("Cost: \(entry.cost)")
                Swift.print("Special: \(special)")
                Swift.print("===\n")
            }
        }
    }


    /**
     Prints the dishes that are marked as having a dietary requirement in an order

     - Parameters:
     - order: an Array of `Dish` objects

     - Returns: Prints to the console

     */
    mutating func printDietaryDishes() {
        for entry in order {
            if let dietary = entry.dietary {
                Swift.print("===")
                Swift.print("Name: \(entry.name)")
                Swift.print("Ingredients:")
                for ingredient in entry.ingredients {
                    print("- \(ingredient.ingredient)")
                }
                Swift.print("Cusine: \(entry.cuisine)")
                Swift.print("Meal Type: \(entry.mealType)")
                Swift.print("Cost: \(entry.cost)")
                Swift.print("Dietary: \(dietary)")
                Swift.print("===\n")
            }
        }
    }
    /**
     Calculates the total cost of an `order` based on actual cost

     - Parameters:
     - discounted: Bool - Use discounted prices

     - Returns: `total`, the total cost of the dished in the order

     */
    mutating func totalOrder(discounted: Bool) -> Double {
        var total: Double = 0.0
        for entry in order {
            if discounted {
                total += entry.finalCost
            } else {
                total += entry.cost
            }
        }
        return total
    }
}

extension Double {
    func roundNearest() -> Double {
        let intPart: Int = Int(self)
        let decimalPart: Double = self - Double(intPart)
        if decimalPart >= 0.5 {
            return Double(intPart) + 1.0
        } else {
            return Double(intPart)
        }
        // The block inside the extension could be replaced by:
        // return self.rounded()
    }
}
