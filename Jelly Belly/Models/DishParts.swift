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
//    public static let mealType = [("Starter", "🥗"), ("Main", "🍽"), ("Dessert", "🍰"), ("Drink", "🥤")]
    
    enum MealCategory: String, CaseIterable {
        case starter = "Starter"
        case main = "Main"
        case dessert = "Dessert"
        case drink = "Drink"
    }
    
    public static let calorieValue: [String: Double] = [
        "Alcohol": 250.0,
        "Beef": 300.0,
        "Bread": 250.0,
        "Cheddar": 150.0,
        "Chicken": 110.0,
        "Chilli Sauce": 180.0,
        "Chillies": 30.0,
        "Chocolate": 250.0,
        "Coffee": 10.0,
        "Corn flour": 120.0,
        "Cream": 250.0,
        "Edamame": 70.0,
        "Egg": 80.0,
        "Emmental": 110.0,
        "Fish": 120.0,
        "Flour": 135.0,
        "Fusilli": 450.0,
        "Garlic": 20.0,
        "Lemon": 100.0,
        "Lettuce": 30.0,
        "Mascarpone": 450.0,
        "Milk": 100.0,
        "Mozarella": 400.0,
        "Olives": 50.0,
        "Onion": 30.0,
        "Orange": 120.0,
        "Parmesan": 300.0,
        "Pasta Sauce ": 180.0,
        "Pizza Base": 500.0,
        "Rice": 145.0,
        "Sugar": 250.0,
        "Tomato": 60.0,
        "Tortillas": 110.0,
        "Water": 0.0
        ]
    public static let diet = ["Vegetarian", "Vegan", "Kosher", "Lactose Free", "Gluten Free"]
    
}
