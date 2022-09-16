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
    Dish(
      name: "Fusilli Arrabiata",
      ingredients: [
         Ingredients(ingredient: "Fusilli", portion:2),
         Ingredients(ingredient: "Parmesan", portion:1),
         Ingredients(ingredient: "Pasta Sauce ", portion:1)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .main,
      cost: 15,
      special: true,
      discountable: true
   ),
    Dish(
      name: "Pizza Margherita",
      ingredients: [
         Ingredients(ingredient: "Pizza Base", portion:1),
         Ingredients(ingredient: "Mozarella", portion:2),
         Ingredients(ingredient: "Pasta Sauce ", portion:2)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .main,
      cost: 19,
      dietary: DishParts.diet[0]
   ),
    Dish(
      name: "Lemonade",
      ingredients: [
         Ingredients(ingredient: "Lemon", portion:3),
         Ingredients(ingredient: "Sugar", portion:1)
      ],
      cuisine: DishParts.cuisine[2],
      mealCategory: .drink,
      cost: 9,
      dietary: DishParts.diet[1]
   ),
    Dish(
      name: "Naranjada",
      ingredients: [
         Ingredients(ingredient: "Orange", portion:3),
         Ingredients(ingredient: "Sugar", portion:0.5)
      ],
      cuisine: DishParts.cuisine[1],
      mealCategory: .drink,
      cost: 12,
      dietary: DishParts.diet[1],
      discountable: true
   ),
    Dish(
      name: "Garlic Bread",
      ingredients: [
         Ingredients(ingredient: "Garlic", portion:1),
         Ingredients(ingredient: "Parmesan", portion:2),
         Ingredients(ingredient: "Bread", portion:2)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .starter,
      cost: 9,
      dietary: "",
      discountable: true
   ),
    Dish(
      name: "Tiramisu",
      ingredients: [
         Ingredients(ingredient: "Chocolate", portion:1),
         Ingredients(ingredient: "Cream", portion:2),
         Ingredients(ingredient: "Mascarpone", portion:2),
         Ingredients(ingredient: "Coffee", portion:1)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .dessert,
      cost: 14,
      special: true,
      discountable: true
   ),
    Dish(
      name: "Hamburger",
      ingredients: [
         Ingredients(ingredient: "Beef", portion:2),
         Ingredients(ingredient: "Cheddar", portion:1),
         Ingredients(ingredient: "Lettuce", portion:2),
         Ingredients(ingredient: "Tomato", portion:1)
      ],
      cuisine: DishParts.cuisine[2],
      mealCategory: .main,
      cost: 19
   ),
    Dish(
      name: "Enchiladas",
      ingredients: [
         Ingredients(ingredient: "Tortillas", portion:4),
         Ingredients(ingredient: "Chicken", portion:4),
         Ingredients(ingredient: "Chilli Sauce", portion:1),
         Ingredients(ingredient: "Cheddar", portion:1)
      ],
      cuisine: DishParts.cuisine[1],
      mealCategory: .main,
      cost: 18
   ),
    Dish(
      name: "Sushi",
      ingredients: [
         Ingredients(ingredient: "Fish", portion:5),
         Ingredients(ingredient: "Rice", portion:5)
      ],
      cuisine: DishParts.cuisine[3],
      mealCategory: .main,
      cost: 25,
      dietary: DishParts.diet[4],
      discountable: true
   ),
    Dish(
      name: "Red Wine",
      ingredients: [
         Ingredients(ingredient: "Alcohol", portion:1)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .drink,
      cost: 12,
      special: true
   ),
    Dish(
      name: "White Wine",
      ingredients: [
         Ingredients(ingredient: "Alcohol", portion:1)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .drink,
      cost: 12
   ),
    Dish(
      name: "Water",
      ingredients: [
         Ingredients(ingredient: "Water", portion:1)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .drink,
      cost: 6,
      discountable: true
   ),
    Dish(
      name: "Nachos",
      ingredients: [
         Ingredients(ingredient: "Tortillas", portion:8),
         Ingredients(ingredient: "Cheddar", portion:3),
         Ingredients(ingredient: "Chillies", portion:3),
         Ingredients(ingredient: "Cream", portion:2)
      ],
      cuisine: DishParts.cuisine[1],
      mealCategory: .starter,
      cost: 10
   ),
    Dish(
      name: "Onion Soup",
      ingredients: [
         Ingredients(ingredient: "Onion", portion:1),
         Ingredients(ingredient: "Emmental", portion:2)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .starter,
      cost: 9,
      special: true,
      dietary: DishParts.diet[0]
   ),
    Dish(
      name: "Edamame",
      ingredients: [
         Ingredients(ingredient: "Edamame", portion:3)
      ],
      cuisine: DishParts.cuisine[3],
      mealCategory: .starter,
      cost: 8,
      dietary: DishParts.diet[1],
      discountable: true
   ),
    Dish(
      name: "Olives",
      ingredients: [
         Ingredients(ingredient: "Olives", portion:3)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .starter,
      cost: 9
   ),
    Dish(
      name: "Crème Brulee",
      ingredients: [
         Ingredients(ingredient: "Cream", portion:2),
         Ingredients(ingredient: "Egg", portion:1),
         Ingredients(ingredient: "Sugar", portion:2)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .dessert,
      cost: 12,
      discountable: true
   ),
    Dish(
      name: "Mochi",
      ingredients: [
         Ingredients(ingredient: "Rice", portion:2),
         Ingredients(ingredient: "Sugar", portion:1),
         Ingredients(ingredient: "Corn flour", portion:1)
      ],
      cuisine: DishParts.cuisine[3],
      mealCategory: .dessert,
      cost: 8,
      dietary: DishParts.diet[2]
   ),
    Dish(
      name: "Ice cream",
      ingredients: [
         Ingredients(ingredient: "Egg", portion:1),
         Ingredients(ingredient: "Sugar", portion:3),
         Ingredients(ingredient: "Corn flour", portion:1),
         Ingredients(ingredient: "Milk", portion:1)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .dessert,
      cost: 8,
      special: true
   ),
    Dish(
      name: "Chocolate cake",
      ingredients: [
         Ingredients(ingredient: "Flour", portion:1),
         Ingredients(ingredient: "Chocolate ", portion:3),
         Ingredients(ingredient: "Egg", portion:1),
         Ingredients(ingredient: "Milk", portion:2)
      ],
      cuisine: DishParts.cuisine[2],
      mealCategory: .dessert,
      cost: 10,
      discountable: true
   )
   ]

let dishes1: [Dish] = [
    Dish(name: "Fusilli Arrabiata",
         ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                       Ingredients(ingredient: "Parmesan", portion: 1.0),
                       Ingredients(ingredient: "Pasta Sauce", portion: 1.0)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .main,
         cost: 15.0,
         special: true,
         discountable: true),
    Dish(name: "Pizza Margherita",
         ingredients: [Ingredients(ingredient: "Pizza Base", portion: 1.0),
                       Ingredients(ingredient: "Mozarella", portion: 2.0),
                       Ingredients(ingredient: "Pasta Sauce", portion: 2.0)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .main,
         cost: 19.0,
         dietary: DishParts.diet[0],
         discountable: false),
    Dish(name: "Lemonade",
         ingredients: [Ingredients(ingredient: "Lemon", portion: 3.0),
                       Ingredients(ingredient:"Sugar", portion: 1.0)],
         cuisine: DishParts.cuisine[2],
         mealCategory: .drink,
         cost: 9.0),
    Dish(name: "Naranjada",
         ingredients: [Ingredients(ingredient: "Orange", portion: 3),
                       Ingredients(ingredient: "Sugar", portion: 0.5)],
         cuisine: DishParts.cuisine[1],
         mealCategory: .drink,
         cost: 12.0,
         special: true),
    Dish(name: "Garlic Bread",
         ingredients: [Ingredients(ingredient: "Garlic", portion: 1),
                       Ingredients(ingredient: "Parmesan", portion: 2),
                       Ingredients(ingredient: "Bread", portion: 2)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .starter,
         cost: 9.0,
         dietary: DishParts.diet[0],
         discountable: true),
    Dish(name: "Tiramisu",
         ingredients: [Ingredients(ingredient: "Chocolate", portion: 1),
                       Ingredients(ingredient: "Cream", portion: 2),
                       Ingredients(ingredient: "Mascarpone", portion:  2),
                       Ingredients(ingredient: "Coffee", portion: 1)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .dessert,
         cost: 14.0,
         discountable: false)
]

let testDish = Dish(name: "Fusilli Arrabiata",
                    ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                                  Ingredients(ingredient:"Parmesan", portion: 1.0),
                                  Ingredients(ingredient:"Pasta Sauce", portion: 1.0)],
                    cuisine: DishParts.cuisine[0],
                    mealCategory: .main,
                    cost: 15.0,
                    special: true,
                    dietary: DishParts.diet[0],
                    discountable: true)

var myOrder = Order()

