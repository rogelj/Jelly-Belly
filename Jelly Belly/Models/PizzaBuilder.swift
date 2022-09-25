//
//  PizzaIngredients.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/09/2022.
//

import SwiftUI

// PRODUCT - DISH, Builder - PizzaBuilder, Director - View
enum Proteins: String, CaseIterable, Identifiable {
    case none = "Pick one"
    case chicken
    case ham
    case egg
    case quorn
    
    var id: String { self.rawValue }
    
    var proteinIngredients: PizzaIngredients {
            switch self {
            case .none: return PizzaIngredients(ingredients: Ingredients(ingredient: "", portion: 0.0), cost: 0.0)
            case .chicken: return PizzaIngredients(ingredients: Ingredients(ingredient: "Chicken", portion: 1.0), cost: 3.0)
            case .ham: return  PizzaIngredients(ingredients: Ingredients(ingredient: "Ham", portion: 1.0), cost: 4.0)
            case .egg: return PizzaIngredients(ingredients: Ingredients(ingredient: "Egg", portion: 1.0), cost: 2.0)
            case .quorn: return PizzaIngredients(ingredients: Ingredients(ingredient: "Quorn", portion: 1.0), cost: 2.5)
            }
        }
}

enum Cheeses: String, CaseIterable, Identifiable {
    case none = "Pick one"
    case mozarella
    case goatsCheese = "Goat's Cheese"
    case gorgonxola
    case sheese
    
    var id: String { self.rawValue }
    var cheeseIngredients: PizzaIngredients {
        switch self {
        case .none: return PizzaIngredients(ingredients: Ingredients(ingredient: "", portion: 0.0), cost: 0.0)
        case .mozarella: return PizzaIngredients(ingredients: Ingredients(ingredient: "Mozarella", portion: 1.0), cost: 2.0)
        case .goatsCheese: return PizzaIngredients(ingredients: Ingredients(ingredient: "Goat's Cheese", portion: 2.0), cost: 3.0)
        case .gorgonxola: return PizzaIngredients(ingredients: Ingredients(ingredient: "Gotgonzola", portion: 1.0), cost: 3.0)
        case .sheese: return PizzaIngredients(ingredients: Ingredients(ingredient: "Sheese", portion: 1.0), cost: 2.0)
        }
    }
}

enum Sauces: String, CaseIterable, Identifiable {
    case none = "Pick one"
    case pastaSauce = "Pasta Sauce"
    case tomatoSauce = "Tomato Sauce"
    case whiteSauce = "White Sauce"
    
    var id: String { self.rawValue }

    var saugeIngredients: PizzaIngredients {
        switch self {
        case .none: return PizzaIngredients(ingredients: Ingredients(ingredient: "", portion: 0.0), cost: 0.0)
        case .pastaSauce : return PizzaIngredients(ingredients: Ingredients(ingredient: "Pasta Sauce", portion: 1.0), cost: 1.0)
        case .tomatoSauce : return PizzaIngredients(ingredients: Ingredients(ingredient: "Tomato Sauce", portion: 1.0), cost: 1.0)
        case .whiteSauce : return PizzaIngredients(ingredients: Ingredients(ingredient: "White Sauce", portion: 1.0), cost: 1.0)
        }
    }
}

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


public class JBPizzaBuilder {
    private(set) var protein: Int?
    private(set) var cheese: Int = 0
    private(set) var vegetables: [Int] = []
    private(set) var sauce: Int = 0
    var ingredients: [Ingredients] = [Ingredients(ingredient: "Pizza Base", portion: 1.0)]
    var cost: Double = 5.0
    
    func setProtein(_ protein: Proteins) {
        self.ingredients.append(protein.proteinIngredients.ingredients)
        self.cost += protein.proteinIngredients.cost
    }
    
    func setCheese(_ cheese: Cheeses) {
        self.ingredients.append(cheese.cheeseIngredients.ingredients)
        self.cost += cheese.cheeseIngredients.cost
    }
    
    func setSauce(_ sauce: Sauces) {
        self.ingredients.append(sauce.saugeIngredients.ingredients)
        self.cost += sauce.saugeIngredients.cost
    }
    
    func addVegetable(_ vegetable: [Int]) {
        for veggie in vegetable {
            self.ingredients.append(vegetableIngredients[veggie].ingredients)
            self.cost += vegetableIngredients[veggie].cost
        }
    }
    
    func build() -> Dish {
        let name = "JB Pizza"
    
        return  Dish(name: name, ingredients: ingredients, cuisine: DishParts.cuisine[0], mealCategory: DishParts.MealCategory.main, cost: cost)
    }
}

//let builder = JBPizzaBuilder()
//builder.setProtein(1)
//builder.setSauce(2)
//builder.setCheese(0)
//builder.addVegetable([2,4,5])
//builder.build()

