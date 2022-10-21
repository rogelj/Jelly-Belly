//
//  Jelly_BellyUIDishMenuTests.swift
//  Jelly_BellyUITests
//
//  Created by J Rogel PhD on 21/10/2022.
//

import XCTest
import SwiftUI
@testable import Jelly_Belly

final class Jelly_BellyUIDishMenuTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Menu() throws {

        let tabBar = app.tabBars["Tab Bar"]
        let menuTab = tabBar.buttons["Menu"]
        let orderTab = tabBar.buttons["Order"]

        menuTab.tap()
        XCTAssert(menuTab.exists)


        let dishButton = XCUIApplication().scrollViews.otherElements.buttons.firstMatch
        XCTAssert(dishButton.exists)

        let dishName = String(dishButton.label.description)
        dishButton.tap()
        print(dishName)

        let addToOrderButton = app.buttons["Add to Order"]
        XCTAssert(addToOrderButton.exists)
        addToOrderButton.tap()

        let backButton = app.buttons["Back"]
        XCTAssert(backButton.exists)
        backButton.tap()

        orderTab.tap()
        XCTAssert(orderTab.exists)

        XCTAssertEqual(
        app.staticTexts
            .matching(identifier: "filledOrder")
            .firstMatch
            .label,
        "Enjoy your meal!"
        )

        XCTAssertEqual(
            app.staticTexts
                .matching(identifier: "YourOrder")
                .firstMatch
                .label,
            "Your Order"
        )
    }

    func test_Specials() throws {

        let tabBar = app.tabBars["Tab Bar"]
        let specialsTab = tabBar.buttons["Specials"]

        specialsTab.tap()
        XCTAssert(specialsTab.exists)

        let dishButton = XCUIApplication().collectionViews.buttons.firstMatch

        XCTAssert(dishButton.exists)

        let dishName = String(dishButton.label.description)
        dishButton.tap()
        print(dishName)

        let saveButton = app.buttons["Save"]
        XCTAssert(saveButton.exists)
        saveButton.tap()


        let tagsButton = app.buttons["Tags"]
        XCTAssert(tagsButton.exists)
        tagsButton.tap()

        let dismissButton = app.buttons["Dismiss"]
        XCTAssert(dismissButton.exists)
        dismissButton.tap()


    }
}
