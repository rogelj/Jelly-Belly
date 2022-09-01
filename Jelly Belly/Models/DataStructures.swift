//
//  DataStructures.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/08/2022.
//

import Foundation
import UIKit

/**
 `Dish` struct to hold dishes that are served at the restaurant.
 
 The dish class will comprise:
    - `name: String`
    - `ingredients`: `Array` of `Tuples` `[(item, portion)]`
    - `cusine: String`
    - `mealType: String`
    - `special: Bool` (optional) - Is the dish a special this month?
    - `dietary: Array` (optional) - Dietary restriction
    - `cost: Double`
*/

struct Ingredients {
    var ingredient: String
    var portion: Double
}

struct Dish {
    let name: String
    var ingredients: [Ingredients]
    var cuisine: String
    var mealType: (String, String)
    var cost: Double
    var special: Bool?       // ### Assignment 3 - Making at least one property optional
    var dietary: String?     // ### Assignment 3 - Making at least one property optional
    
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
        return calories  // **Nice to have** - implementing a method with `return`
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
                                        special: true)
            
            let pizzaMargherita = Dish(name: "Pizza Margherita",
                                       ingredients: [Ingredients(ingredient: "Pizza Base", portion: 1.0),
                                                     Ingredients(ingredient: "Mozarella", portion: 2.0),
                                                     Ingredients(ingredient: "Pasta Sauce", portion: 2.0)],
                                       cuisine: DishParts.cuisine[0],
                                       mealType: DishParts.mealType[1],
                                       cost: 19.0,
                                       dietary: DishParts.diet[0])
            
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
                                   dietary: DishParts.diet[0])
            
            let tiramisu = Dish(name: "Tiramisu",
                                ingredients: [Ingredients(ingredient: "Chocolate", portion: 1),
                                              Ingredients(ingredient: "Cream", portion: 2),
                                              Ingredients(ingredient: "Mascarpone", portion:  2),
                                              Ingredients(ingredient: "Coffee", portion: 1)],
                                cuisine: DishParts.cuisine[0],
                                mealType: DishParts.mealType[2],
                                cost: 14.0)
            
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
     Calculates the total cost of an `order`
     
     - Parameters:
     - order: an Array of `Dish` objects
     
     - Returns: `total`, the total cost of the dished in the order
     
     */
    mutating func totalOrder() -> Double {
        var total: Double = 0.0
        for entry in order {
            total += entry.cost
        }
        return total
    }

}
