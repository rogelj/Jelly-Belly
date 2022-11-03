//
//  Jelly_BellyTests.swift
//  Jelly BellyTests
//
//  Created by J Rogel PhD on 20/10/2022.
//

import XCTest
@testable import Jelly_Belly

final class Jelly_BellyDishTests: XCTestCase {

    var dishDisc: Dish!
    var dishNoDisc: Dish!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dishDisc = Dish(name: "Fusilli Arrabiata",
                    ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                                  Ingredients(ingredient:"Parmesan", portion: 1.0),
                                  Ingredients(ingredient:"Pasta Sauce", portion: 1.0)],
                    cuisine: DishParts.cuisine[0],
                    mealCategory: .main,
                    cost: 100.0,
                    special: true,
                    dietary: DishParts.diet[0],
                    discountable: true,
                    description: "Fussilli Arrabiata made with whole meal pasta and fresh tomatoes.")

        dishNoDisc = Dish(name: "Fusilli Arrabiata",
                        ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                                      Ingredients(ingredient:"Parmesan", portion: 1.0),
                                      Ingredients(ingredient:"Pasta Sauce", portion: 1.0)],
                        cuisine: DishParts.cuisine[0],
                        mealCategory: .main,
                        cost: 100.0,
                        special: true,
                        dietary: DishParts.diet[0],
                        discountable: false,
                        description: "Fussilli Arrabiata made with whole meal pasta and fresh tomatoes.")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dishDisc = nil
        dishNoDisc = nil
    }

    func test_FinalCostDiscountable() {
        dishDisc.discountFactor = 0.1
        let finalCost = dishDisc.finalCost
        XCTAssertEqual(
            try XCTUnwrap(finalCost), 90, accuracy: pow(0.1, 12)
        )
    }

    func test_FinalCostNotDiscountable() {
        dishNoDisc.discountFactor = 0.1
        let finalCost = dishNoDisc.finalCost
        XCTAssertEqual(finalCost, 100)
    }

    func test_getCalories() {
        let calories = dishDisc.getCalories()
        XCTAssertEqual(calories, 1380)
    }

    func test_getDishes() {
        let numDishes = Dish.getDishes(by: .main).count
        XCTAssertEqual(numDishes, 2)
    }

    func test_getDiscountDishes() {
        let numDishes = Dish.getDiscountDishes(by: .main).count
        XCTAssertEqual(numDishes, 1)
    }
}
