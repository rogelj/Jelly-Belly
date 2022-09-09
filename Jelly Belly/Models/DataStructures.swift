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
            var testOrder = Order()
            let fusilliArrabiata = Dish(name: "Fusilli Arrabiata",
                                        ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                                                      Ingredients(ingredient: "Parmesan", portion: 1.0),
                                                      Ingredients(ingredient: "Pasta Sauce", portion: 1.0)],
                                        cuisine: DishParts.cuisine[0],
                                        mealType: DishParts.mealType[1],
                                        cost: 15.0,
                                        special: true,
                                        discountable: true)

            let pizzaMargherita = Dish(name: "Pizza Margherita",
                                       ingredients: [Ingredients(ingredient: "Pizza Base", portion: 1.0),
                                                     Ingredients(ingredient: "Mozarella", portion: 2.0),
                                                     Ingredients(ingredient: "Pasta Sauce", portion: 2.0)],
                                       cuisine: DishParts.cuisine[0],
                                       mealType: DishParts.mealType[1],
                                       cost: 19.0,
                                       dietary: DishParts.diet[0],
                                       discountable: false)

            let lemonade = Dish(name: "Lemonade",
                                ingredients: [Ingredients(ingredient: "Lemon", portion: 3.0),
                                              Ingredients(ingredient:"Sugar", portion: 1.0)],
                                cuisine: DishParts.cuisine[2],
                                mealType: DishParts.mealType[3],
                                cost: 9.0)

            let naranjada = Dish(name: "Naranjada",
                                 ingredients: [Ingredients(ingredient: "Orange", portion: 3),
                                               Ingredients(ingredient: "Sugar", portion: 0.5)],
                                 cuisine: DishParts.cuisine[1],
                                 mealType: DishParts.mealType[3],
                                 cost: 12.0,
                                 special: true)

            let garlicBread = Dish(name: "Garlic Bread",
                                   ingredients: [Ingredients(ingredient: "Garlic", portion: 1),
                                                 Ingredients(ingredient: "Parmesan", portion: 2),
                                                 Ingredients(ingredient: "Bread", portion: 2)],
                                   cuisine: DishParts.cuisine[0],
                                   mealType: DishParts.mealType[0],
                                   cost: 9.0,
                                   dietary: DishParts.diet[0],
                                   discountable: true)

            let tiramisu = Dish(name: "Tiramisu",
                                ingredients: [Ingredients(ingredient: "Chocolate", portion: 1),
                                              Ingredients(ingredient: "Cream", portion: 2),
                                              Ingredients(ingredient: "Mascarpone", portion:  2),
                                              Ingredients(ingredient: "Coffee", portion: 1)],
                                cuisine: DishParts.cuisine[0],
                                mealType: DishParts.mealType[2],
                                cost: 14.0,
                                discountable: false)

            testOrder.addToOrder(dish: fusilliArrabiata)
            testOrder.addToOrder(dish: pizzaMargherita)
            testOrder.addToOrder(dish: lemonade)
            testOrder.addToOrder(dish: naranjada)
            testOrder.addToOrder(dish: garlicBread)
            testOrder.addToOrder(dish: tiramisu)
            order = testOrder.order
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
