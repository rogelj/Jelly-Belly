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
    var myOrdercaretaker = OrderCaretaker()
    var newOrdercaretaker = OrderCaretaker()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dishDisc = Dish(name: "Fusilli Arrabiata",
                        ingredients: [Ingredients(ingredient: "Fusilli", portion: 2.0),
                                      Ingredients(ingredient:"Parmesan", portion: 1.0),
                                      Ingredients(ingredient:"Pasta Sauce", portion: 1.0)],
                        cuisine: DishParts.cuisine[0],
                        mealCategory: .miscellaneous,
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
                          mealCategory: .miscellaneous,
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
        newOrder = nil
        newOrdercaretaker = OrderCaretaker()
        myOrdercaretaker = OrderCaretaker()
    }

    func test_NumDishesInOrder() {
        let numDishes = myOrder.order.count
        XCTAssertEqual(numDishes, 20)
    }

    func test_InitOrder() {
        newOrder = Order(order: [dishDisc, dishNoDisc])
        XCTAssertNotNil(newOrder)
    }

    // Testing constants - Double rounding

    func test_RoundNearestUp() {
        let num = 0.6.roundNearest()
        XCTAssertEqual(num, 1.0)
    }

    func test_RoundNearestDown() {
        let num = 0.4.roundNearest()
        XCTAssertEqual(num, 0.0)
    }

    func test_OrdercaretakerMemento() {
        addToOrder(orderCaretaker: myOrdercaretaker, dish: dishDisc)
        var numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 1)

        removeFromOrder(orderCaretaker: myOrdercaretaker, dish: dishDisc)
        numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 0)

        addToOrder(orderCaretaker: myOrdercaretaker, dish: dishDisc)
        addToOrder(orderCaretaker: myOrdercaretaker, dish: dishNoDisc)
        numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 2)

        myOrdercaretaker.clear()
        numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 0)

        myOrdercaretaker.undo()
        numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 2)

        myOrdercaretaker.undo()
        myOrdercaretaker.clear()
        numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 0)
    }

    func test_OrdercaretakerEmpty() {
        var numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 0)

        myOrdercaretaker.undo()
        numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 0)

    }

    func test_OrdercaretakerCalculations() {
        addToOrder(orderCaretaker: myOrdercaretaker, dish: dishDisc)
        addToOrder(orderCaretaker: myOrdercaretaker, dish: dishNoDisc)
        let numDishes = myOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 2)

        var total = myOrdercaretaker.totalOrder(discounted: true)
        XCTAssertEqual(total, 190)

        total = myOrdercaretaker.totalOrder(discounted: false)
        XCTAssertEqual(total, 200)

        myOrdercaretaker.printOrder()
        myOrdercaretaker.printSpecials()
        myOrdercaretaker.printDietaryDishes()
    }

    func test_InitOrdercaretaker() {
        newOrdercaretaker = OrderCaretaker(loadTestData: true)
        let numDishes = newOrdercaretaker.order.count
        XCTAssertEqual(numDishes, 7)
    }
}
