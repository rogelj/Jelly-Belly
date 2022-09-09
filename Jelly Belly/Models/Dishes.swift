//
//  Dishes.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import Foundation

import SwiftUI

extension Dish: Identifiable { }

// Moving my test data into a separate file so I can reuse it elsewhere
let dishes: [Dish] = [
    Dish(name: "Fusilli Arrabiata",
         ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                       Ingredients(ingredient: "Parmesan", portion: 1.0),
                       Ingredients(ingredient: "Pasta Sauce", portion: 1.0)],
         cuisine: DishParts.cuisine[0],
         mealType: DishParts.mealType[1],
         cost: 15.0,
         special: true,
         discountable: true),
    Dish(name: "Pizza Margherita",
         ingredients: [Ingredients(ingredient: "Pizza Base", portion: 1.0),
                       Ingredients(ingredient: "Mozarella", portion: 2.0),
                       Ingredients(ingredient: "Pasta Sauce", portion: 2.0)],
         cuisine: DishParts.cuisine[0],
         mealType: DishParts.mealType[1],
         cost: 19.0,
         dietary: DishParts.diet[0],
         discountable: false),
    Dish(name: "Lemonade",
         ingredients: [Ingredients(ingredient: "Lemon", portion: 3.0),
                       Ingredients(ingredient:"Sugar", portion: 1.0)],
         cuisine: DishParts.cuisine[2],
         mealType: DishParts.mealType[3],
         cost: 9.0),
    Dish(name: "Naranjada",
         ingredients: [Ingredients(ingredient: "Orange", portion: 3),
                       Ingredients(ingredient: "Sugar", portion: 0.5)],
         cuisine: DishParts.cuisine[1],
         mealType: DishParts.mealType[3],
         cost: 12.0,
         special: true),
    Dish(name: "Garlic Bread",
         ingredients: [Ingredients(ingredient: "Garlic", portion: 1),
                       Ingredients(ingredient: "Parmesan", portion: 2),
                       Ingredients(ingredient: "Bread", portion: 2)],
         cuisine: DishParts.cuisine[0],
         mealType: DishParts.mealType[0],
         cost: 9.0,
         dietary: DishParts.diet[0],
         discountable: true),
    Dish(name: "Tiramisu",
         ingredients: [Ingredients(ingredient: "Chocolate", portion: 1),
                       Ingredients(ingredient: "Cream", portion: 2),
                       Ingredients(ingredient: "Mascarpone", portion:  2),
                       Ingredients(ingredient: "Coffee", portion: 1)],
         cuisine: DishParts.cuisine[0],
         mealType: DishParts.mealType[2],
         cost: 14.0,
         discountable: false)
]

