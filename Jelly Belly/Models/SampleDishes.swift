//
//  Dishes.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import Foundation

import SwiftUI

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
      mealCategory: .miscellaneous,
      cost: 15,
      special: true,
      discountable: true,
      description: "Fussilli Arrabiata mades with whole meal pasta and fresh tomatoes."
   ),
    Dish(
      name: "Pizza Margherita",
      ingredients: [
         Ingredients(ingredient: "Pizza Base", portion:1),
         Ingredients(ingredient: "Mozarella", portion:2),
         Ingredients(ingredient: "Pasta Sauce ", portion:2)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .miscellaneous,
      cost: 19,
      dietary: DishParts.diet[0],
      description: "Fresh pizza dough with mozarella."
   ),
    Dish(
      name: "Lemonade",
      ingredients: [
         Ingredients(ingredient: "Lemon", portion:3),
         Ingredients(ingredient: "Sugar", portion:1)
      ],
      cuisine: DishParts.cuisine[2],
      mealCategory: .miscellaneous,
      cost: 9,
      dietary: DishParts.diet[1],
      description: "Lemons and sugar, nothing else."
   ),
    Dish(
      name: "Naranjada",
      ingredients: [
         Ingredients(ingredient: "Orange", portion:3),
         Ingredients(ingredient: "Sugar", portion:0.5)
      ],
      cuisine: DishParts.cuisine[1],
      mealCategory: .miscellaneous,
      cost: 12,
      dietary: DishParts.diet[1],
      discountable: true,
      description: "Orange and sugar, nothing else."
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
      discountable: true,
      description: "Toasted bread with garlic oil."
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
      discountable: true,
      description: "Chocolate and mascarpone with coffee"
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
      mealCategory: .miscellaneous,
      cost: 19,
      description: "Beef burger with cheese"
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
      mealCategory: .miscellaneous,
      cost: 18,
      description: "Mexican tortillas in a chilli sauce."
   ),
    Dish(
      name: "Sushi",
      ingredients: [
         Ingredients(ingredient: "Fish", portion:5),
         Ingredients(ingredient: "Rice", portion:5)
      ],
      cuisine: DishParts.cuisine[3],
      mealCategory: .miscellaneous,
      cost: 25,
      dietary: DishParts.diet[4],
      discountable: true,
      description: "Salmon avocado roll."
   ),
    Dish(
      name: "Red Wine",
      ingredients: [
         Ingredients(ingredient: "Alcohol", portion:1)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .miscellaneous,
      cost: 12,
      special: true,
      description: "Baja Californian rich red wine"
   ),
    Dish(
      name: "White Wine",
      ingredients: [
         Ingredients(ingredient: "Alcohol", portion:1)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .miscellaneous,
      cost: 12,
      description: "Argentinean fruity white wine"
   ),
    Dish(
      name: "Water",
      ingredients: [
         Ingredients(ingredient: "Water", portion:1)
      ],
      cuisine: DishParts.cuisine[4],
      mealCategory: .miscellaneous,
      cost: 6,
      discountable: true,
      description: "Bottled mineral water"
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
      cost: 10,
      description: "Mexican tortilla chips with cheese and jalapeños."
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
      dietary: DishParts.diet[0],
      description: "French onion soup with croutons and cheese."
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
      discountable: true,
      description: "Salted edamame soy beans."
   ),
    Dish(
      name: "Olives",
      ingredients: [
         Ingredients(ingredient: "Olives", portion:3)
      ],
      cuisine: DishParts.cuisine[0],
      mealCategory: .starter,
      cost: 9,
      description: "Olives, nothing else."
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
      discountable: true,
      description: "Rich custard base topped with a layer of hardened caramelized sugar."
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
      dietary: DishParts.diet[2],
      description: "Japanese rice cake made of mochigome (もち米), a short-grain japonica glutinous rice, and sometimes other ingredients such as water, sugar, and cornstarch."
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
      special: true,
      description: "Italian ice cream, nothing else."
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
      discountable: true,
      description: "Dark chocolate cake"
   )
   ]

let dishes1: [Dish] = [
    Dish(name: "Fusilli Arrabiata",
         ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                       Ingredients(ingredient: "Parmesan", portion: 1.0),
                       Ingredients(ingredient: "Pasta Sauce", portion: 1.0)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .miscellaneous,
         cost: 15.0,
         special: true,
         discountable: true,
         description: "Fussilli Arrabiata mades with whole meal pasta and fresh tomatoes."
        ),
    Dish(name: "Pizza Margherita",
         ingredients: [Ingredients(ingredient: "Pizza Base", portion: 1.0),
                       Ingredients(ingredient: "Mozarella", portion: 2.0),
                       Ingredients(ingredient: "Pasta Sauce", portion: 2.0)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .miscellaneous,
         cost: 19.0,
         dietary: DishParts.diet[0],
         discountable: false,
         description: "Fresh pizza dough with mozarella."
        ),
    Dish(name: "Lemonade",
         ingredients: [Ingredients(ingredient: "Lemon", portion: 3.0),
                       Ingredients(ingredient:"Sugar", portion: 1.0)],
         cuisine: DishParts.cuisine[2],
         mealCategory: .miscellaneous,
         cost: 9.0,
         description: "Lemons and sugar, nothing else."
        ),
    Dish(name: "Naranjada",
         ingredients: [Ingredients(ingredient: "Orange", portion: 3),
                       Ingredients(ingredient: "Sugar", portion: 0.5)],
         cuisine: DishParts.cuisine[1],
         mealCategory: .miscellaneous,
         cost: 12.0,
         special: true,
         description: "Orange and sugar, nothing else."
        ),
    Dish(name: "Garlic Bread",
         ingredients: [Ingredients(ingredient: "Garlic", portion: 1),
                       Ingredients(ingredient: "Parmesan", portion: 2),
                       Ingredients(ingredient: "Bread", portion: 2)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .starter,
         cost: 9.0,
         dietary: DishParts.diet[0],
         discountable: true,
         description: "Toasted bread with garlic oil."
        ),
    Dish(name: "Tiramisu",
         ingredients: [Ingredients(ingredient: "Chocolate", portion: 1),
                       Ingredients(ingredient: "Cream", portion: 2),
                       Ingredients(ingredient: "Mascarpone", portion:  2),
                       Ingredients(ingredient: "Coffee", portion: 1)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .dessert,
         cost: 14.0,
         discountable: false,
         description: "Chocolate and mascarpone with coffee"
        ),
    Dish(name: "Bitterballen (Dutch meatballs)",
         ingredients: [Ingredients(ingredient: "Egg", portion: 1),
                       Ingredients(ingredient: "Cream", portion: 2),
                       Ingredients(ingredient: "Mascarpone", portion:  2)],
         cuisine: DishParts.cuisine[0],
         mealCategory: .beef,
         cost: 18.0,
         discountable: false,
         description: "Delicious bitterballen - Dutch meatballs with lots of flavour."
        )
]

let testDish = Dish(name: "Bitterballen (Dutch meatballs)",
                    ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                                  Ingredients(ingredient:"Parmesan", portion: 1.0),
                                  Ingredients(ingredient:"Pasta Sauce", portion: 1.0)],
                    cuisine: DishParts.cuisine[0],
                    mealCategory: .miscellaneous,
                    cost: 15.0,
                    special: true,
                    dietary: DishParts.diet[0],
                    discountable: true,
                    description: "Fussilli Arrabiata mades with whole meal pasta and fresh tomatoes.")


