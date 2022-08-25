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
    - `mealtype: String`
    - `special: Bool` (optional) - Is the dish a special this month?
    - `dietary: Array` (optional) - Dietary restriction
    - `cost: Float`
*/
struct Dish {
    let name: String
    var ingredients: [(ingredient: String, portion: Float)]
    var cuisine: String
    var mealtype: (String, String)
    var cost: Float
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
    func getCalories() -> Float {
        var calories: Float = 0.0
        for ingredient in ingredients {
            if let calorieVal = DishParts.calorieValue[ingredient.ingredient] {
                calories += ingredient.portion * calorieVal
            }
        }
        return calories  // **Nice to have** - implementing a method with `return`
    }
}

/**
 - `cuisine` - Holds the different cuisines that are made at the restaurant
 - `mealType` - Holds the sections in the menu a dish belongs to
 - `calorieValue` - Holds the calorie values per potion of ingredient are stored in a dictionary.
 - `diet` - Holds the diet array holds information about the type of dietary requirement the meal meets.
*/
enum DishParts {
    public static let cuisine = ["Italian", "Mexican", "American", "Japanese", "French"]
    public static let mealType = [("Starter", "🥗"), ("Main", "🍽"), ("Dessert", "🍰"), ("Beverage", "🥤")]
    public static let calorieValue: [String: Float] = ["Fusilli": 450.0,
                                      "Mozarella": 400.0,
                                      "Pasta Sauce": 180.0,
                                      "Pizza Base": 500.0,
                                      "Parmesan": 300.0,
                                      "Bread": 180.0,
                                      "Garlic": 20.0,
                                      "Olives": 50.0,
                                      "Lemon":100.0,
                                      "Sugar": 250.0,
                                      "Orange": 120.0,
                                      "Chocolate": 200.0,
                                      "Mascarpone": 450.0,
                                      "Cream": 250.0,
                                      "Coffee": 40.0]
    public static let diet = ["Vegetarian", "Vegan", "Kosher", "Lactose Free", "Gluten Free"]
    
}

struct Order {
    var order: [Dish] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            let fusilliArrabiata = Dish(name: "Fusilli Arrabiata",
                                        ingredients: [(ingredient: "Fusilli", portion: 2.0),
                                                      ("Parmesan", 1.0),
                                                      ("Pasta Sauce", 1.0)],
                                        cuisine: DishParts.cuisine[0],
                                        mealtype: DishParts.mealType[1],
                                        cost: 15.0,
                                        special: true)
            
            let pizzaMargherita = Dish(name: "Pizza Margherita",
                                       ingredients: [(ingredient: "Pizza Base", portion: 1.0),
                                                     ("Mozarella", 2.0),
                                                     ("Pasta Sauce", 2.0)],
                                       cuisine: DishParts.cuisine[0],
                                       mealtype: DishParts.mealType[1],
                                       cost: 19.0,
                                       dietary: DishParts.diet[0])
            
            let lemonade = Dish(name: "Lemonade",
                                ingredients: [(ingredient: "Lemon", portion: 3.0),
                                              ("Sugar", 1.0)],
                                cuisine: DishParts.cuisine[2],
                                mealtype: DishParts.mealType[3],
                                cost: 9.0)
            
            let naranjada = Dish(name: "Naranjada",
                                 ingredients: [(ingredient: "Orange", portion: 3),
                                               ("Sugar", 0.5)],
                                 cuisine: DishParts.cuisine[1],
                                 mealtype: DishParts.mealType[3],
                                 cost: 12.0,
                                 special: true)
            
            let garlicBread = Dish(name: "Garlic Bread",
                                   ingredients: [(ingredient: "Garlic", portion: 1),
                                                 ("Parmesan", 2),
                                                 ("Bread", 2)],
                                   cuisine: DishParts.cuisine[0],
                                   mealtype: DishParts.mealType[0],
                                   cost: 9.0,
                                   dietary: DishParts.diet[0])
            
            let tiramisu = Dish(name: "Tiramisu",
                                ingredients: [(ingredient: "Chocolate", portion: 1),
                                              ("Cream", 2),
                                              ("Mascarpone", 2),
                                              ("Coffee",1)],
                                cuisine: DishParts.cuisine[0],
                                mealtype: DishParts.mealType[2],
                                cost: 14.0)
            
            order = [fusilliArrabiata, pizzaMargherita, lemonade, naranjada, garlicBread, tiramisu]
        }
    }

    /**
    Prints the dishes that are marked as `special` in an order

     - Parameters:
         - order: an Array of `Dish` objects

     - Returns: Prints to the console

    */
    func printSpecials(order: [Dish]) {
        for entry in order {
            if let special = entry.special {
                Swift.print("===")
                Swift.print("Name: \(entry.name)")
                Swift.print("Ingredients:")
                for ingredient in entry.ingredients {
                    Swift.print("- \(ingredient.0)")
                }
                Swift.print("Cusine: \(entry.cuisine)")
                Swift.print("Meal Type: \(entry.mealtype)")
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
    func printDietaryDishes(order: [Dish]) {
        for entry in order {
            if let dietary = entry.dietary {
                Swift.print("===")
                Swift.print("Name: \(entry.name)")
                Swift.print("Ingredients:")
                for ingredient in entry.ingredients {
                    print("- \(ingredient.0)")
                }
                Swift.print("Cusine: \(entry.cuisine)")
                Swift.print("Meal Type: \(entry.mealtype)")
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
    func totalOrder(order: [Dish]) -> Float {
        var total: Float = 0.0
        for entry in order {
            total += entry.cost
        }
        return total
    }

}
