//
//  PizzaIngredients.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/09/2022.
//

import SwiftUI

// PRODUCT - DISH, Builder - PizzaBuilder, Director - View

var proteinIngredients: [PizzaIngredients] = [
    PizzaIngredients(ingredients: Ingredients(ingredient: "Chicken", portion: 1.0), cost: 3.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Ham", portion: 1.0), cost: 4.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Egg", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Quorn", portion: 1.0), cost: 2.5),
]

var cheeseIngredients: [PizzaIngredients] = [
    PizzaIngredients(ingredients: Ingredients(ingredient: "Mozarella", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Goat's Cheese", portion: 2.0), cost: 3.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Gotgonzola", portion: 1.0), cost: 3.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Sheese", portion: 1.0), cost: 2.0)
]

var vegetableIngredients: [PizzaIngredients] = [
    PizzaIngredients(ingredients: Ingredients(ingredient: "Mushrooms", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Pepperoni", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Olives", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Jalapeño", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Green Peppers", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Sweet Peppers", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Caramelised Onion", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Spinach", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Roasted Peppers", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Jackfruit", portion: 1.0), cost: 2.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Tomatoes", portion: 1.0), cost: 2.0)
]

var sauceIngredients: [PizzaIngredients] = [
    PizzaIngredients(ingredients: Ingredients(ingredient: "Pasta Sauce", portion: 1.0), cost: 1.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "Tomato Sauce", portion: 1.0), cost: 1.0),
    PizzaIngredients(ingredients: Ingredients(ingredient: "White Sauce", portion: 1.0), cost: 1.0)
]
//
//public class JBPizzaBuilder {
//    private(set) var protein: PizzaIngredients?
//    private(set) var cheese: PizzaIngredients = cheeseIngredients["mozarella"]!
//    private(set) var vegetables: [PizzaIngredients] = []
//    private(set) var sauce: PizzaIngredients = sauceIngredients["pastaSauce"]!
//    var ingredients: [Ingredients] = [Ingredients(ingredient: "Pizza Base", portion: 1.0)]
//    var cost: Double = 5.0
//    
//    func setProtein(_ protein: Int) {
//        self.ingredients.append(proteinIngredients[protein].ingredients)
//        self.cost += proteinIngredients[protein].cost
//    }
//    
//    func setCheese(_ cheese: String) {
//        self.ingredients.append(cheeseIngredients[cheese]!.ingredients)
//        self.cost += cheeseIngredients[cheese]!.cost
//    }
//    
//    func setSauce(_ sauce: String) {
//        self.ingredients.append(sauceIngredients[sauce]!.ingredients)
//        self.cost += sauceIngredients[sauce]!.cost
//    }
//    
//    func addVegetable(_ vegetable: [String]) {
//        for veggie in vegetable {
//            self.ingredients.append(vegetableIngredients[veggie]!.ingredients)
//            self.cost += vegetableIngredients[veggie]!.cost
//        }
//    }
//    
//    func build() -> Dish {
//        let name = "JB Pizza"
//    
//        return Dish(name: name, ingredients: ingredients, cuisine: DishParts.cuisine[0], mealCategory: DishParts.MealCategory.main, cost: cost)
//    }
//}

//let builder = JBPizzaBuilder()
//builder.setProtein("chicken")
//builder.setSauce("pastaSauce")
//builder.setCheese("mozarella")
//builder.addVegetable(["caramelisedOnion", "greenPeppers", "jackfruit"])
//builder.build()
