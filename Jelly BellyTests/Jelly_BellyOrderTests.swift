//
//  Jelly_BellyOrderTests.swift
//  Jelly BellyTests
//
//  Created by J Rogel PhD on 20/10/2022.
//

import XCTest
@testable import Jelly_Belly

final class Jelly_BellyOrderTests: XCTestCase {

    var dishDisc: Dish!
    var dishNoDisc: Dish!
    var myOrder: Order!
    var newOrder: Order!

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

        myOrder = Order(loadTestData: true)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dishDisc = nil
        dishNoDisc = nil
        myOrder = nil
    }

    func test_NumDishesInOrder() {
        let numDishes = myOrder.order.count
        XCTAssertEqual(numDishes, 20)
    }

    func test_CreteOrder() {
        newOrder = Order(order: [dishDisc, dishNoDisc])
        XCTAssertNotNil(newOrder)
    }


}
