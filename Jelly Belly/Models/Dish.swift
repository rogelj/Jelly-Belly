//
//  Dish.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 23/09/2022.
//

import Foundation
import UIKit

extension Dish: Identifiable { }

/**
 `Dish` class to hold dishes that are served at the restaurant.

 The dish class will comprise:
    - `name: String`
    - `ingredients`: `Array` of `Ingredients`
    - `cusine: String`
    //- `mealType: String`
    - `mealCategory: DisParts.MealCategory`
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
    var mealCategory: DishParts.MealCategory
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
    
    init(name: String, ingredients: [Ingredients], cuisine: String, mealCategory: DishParts.MealCategory,
         cost: Double, special: Bool? = nil, dietary: String? = nil, discountable: Bool? = nil) {
        self.name = name
        self.ingredients = ingredients
        self.cuisine = cuisine
        self.mealCategory = mealCategory
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

extension Dish {
    static func getDishes(by mealCategory: DishParts.MealCategory) -> [Dish] {
        dishes.filter { dish in
            dish.mealCategory == mealCategory
        }
    }
    
    static func getDiscountDishes(by mealCategory: DishParts.MealCategory) -> [Dish] {
        dishes.filter { dish in
            dish.mealCategory == mealCategory && dish.discountable == true
        }
    }
    
}

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
