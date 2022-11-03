//
//  Jelly_BellyUITests.swift
//  Jelly_BellyUITests
//
//  Created by J Rogel PhD on 20/10/2022.
//

import XCTest
import SwiftUI
@testable import Jelly_Belly

final class Jelly_BellyUITabBarTests: XCTestCase {
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

    func test_Tabs() throws {
        @Environment(\.colorScheme) var colorScheme

        let tabBar = app.tabBars["Tab Bar"]
        let homeTab = tabBar.buttons["Home"]
        let menuTab = tabBar.buttons["Menu"]
        let jbPizzaTab = tabBar.buttons["JB Pizza"]
        let specialsTab = tabBar.buttons["Specials"]
        let orderTab = tabBar.buttons["Order"]

        homeTab.tap()
        XCTAssert(tabBar.exists)

        let imageName = colorScheme == .light ? "JellyBelly" : "JellyBellyDark"

        let jellybellyImage = app.images[imageName]
        jellybellyImage.tap()

        XCTAssert(jellybellyImage.exists)

        menuTab.tap()
        XCTAssert(menuTab.exists)

        jbPizzaTab.tap()
        XCTAssert(jbPizzaTab.exists)

        specialsTab.tap()
        XCTAssert(specialsTab.exists)

        orderTab.tap()
        XCTAssert(orderTab.exists)
    }

    func test_WelcomeOnboarding() throws {

        let tabBar = app.tabBars["Tab Bar"]
        let homeTab = tabBar.buttons["Home"]
        homeTab.tap()
        let infoButton = app.buttons["Info"]
        infoButton.tap()

        XCTAssert(infoButton.exists)

        app.scrollViews.otherElements.staticTexts["Users can choose menu items and add them to their order"].swipeUp()

        let doneButton = app.buttons["Done"]
        XCTAssert(doneButton.exists)

        doneButton.tap()

    }

}
