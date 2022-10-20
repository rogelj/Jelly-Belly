//
//  Jelly_BellyPizzaMakerTest.swift
//  Jelly BellyTests
//
//  Created by J Rogel PhD on 20/10/2022.
//

import XCTest
@testable import Jelly_Belly

final class Jelly_BellyPizzaMakerTest: XCTestCase {

    var protein: Proteins!
    var cheese: Cheeses!
    var sauce: Sauces!
    var vegetable: Vegetables!
    var myPizza = JBPizzaBuilder()

    override func setUpWithError() throws {
        protein = .chicken
        cheese = .mozarella
        sauce = .pastaSauce
        vegetable = .mushrooms
    }

    override func tearDownWithError() throws {
        protein = nil
        cheese = nil
        sauce = nil
        vegetable = nil
    }

    func test_Protein() {
        var ingredient = protein?.proteinIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Chicken")

        let id = protein.id
        XCTAssertEqual(id, "chicken")

        protein = .ham
        ingredient = protein?.proteinIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Ham")

        protein = .egg
        ingredient = protein?.proteinIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Egg")

        protein = .quorn
        ingredient = protein?.proteinIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Quorn")

        protein = Proteins.none
        ingredient = protein?.proteinIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "")
    }

    func test_Cheese() {
        var ingredient = cheese?.cheeseIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Mozarella")

        let id = cheese.id
        XCTAssertEqual(id, "mozarella")

        cheese = .goatsCheese
        ingredient = cheese?.cheeseIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Goat's Cheese")

        cheese = .gorgonzola
        ingredient = cheese?.cheeseIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Gorgonzola")

        cheese = .sheese
        ingredient = cheese?.cheeseIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Sheese")

        cheese = Cheeses.none
        ingredient = cheese?.cheeseIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "")
    }

    func test_Sauce() {
        var ingredient = sauce?.saugeIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Pasta Sauce")

        let id = sauce.id
        XCTAssertEqual(id, "Pasta Sauce")

        sauce = .tomatoSauce
        ingredient = sauce?.saugeIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Tomato Sauce")

        sauce = .whiteSauce
        ingredient = sauce?.saugeIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "White Sauce")

        sauce = Sauces.none
        ingredient = sauce?.saugeIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "")
    }

    func test_Vegetables() {
        var ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Mushrooms")

        let id = vegetable.id
        XCTAssertEqual(id, "mushrooms")

        vegetable = .pepperoni
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Pepperoni")

        vegetable = .olives
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Olives")

        vegetable = .jalapeño
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Jalapeño")

        vegetable = .greenPeppers
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Green Peppers")

        vegetable = .sweetPeppers
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Sweet Peppers")

        vegetable = .roastedPeppers
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Roasted Peppers")

        vegetable = .caremelisedOnion
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Caramelised Onion")

        vegetable = .spinach
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Spinach")

        vegetable = .jackfruit
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Jackfruit")

        vegetable = .tomatoes
        ingredient = vegetable?.vegetableIngredients.ingredients.ingredient
        XCTAssertEqual(ingredient, "Tomatoes")
    }

    func test_setProtein() {
        myPizza.setProtein(.chicken)
        myPizza.setCheese(.mozarella)
        myPizza.setSauce(.pastaSauce)
        myPizza.addVegetable([.mushrooms])

        let numIngredients = myPizza.ingredients.count
        XCTAssertEqual(numIngredients, 5)

        let myDish = myPizza.build()
        XCTAssertEqual(myDish.name, "Your Jelly Belly Pizza")

    }
}
