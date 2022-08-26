//
//  DishInfo.swift
//  Jelly Belly
//
//  Created by Jesus Rogel on 26/08/2022.
//

import Foundation
import UIKit

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
