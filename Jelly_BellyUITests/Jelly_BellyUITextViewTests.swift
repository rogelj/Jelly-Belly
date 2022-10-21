//
//  Jelly_BellyUITests.swift
//  Jelly_BellyUITests
//
//  Created by J Rogel PhD on 20/10/2022.
//

import XCTest
import SwiftUI
@testable import Jelly_Belly

final class Jelly_BellyUITextViewTests: XCTestCase {
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

    func testExample() throws {
        @Environment(\.colorScheme) var colorScheme

        let tabBar = app.tabBars["Tab Bar"]
        let homeTab = tabBar.buttons["Home"]
        homeTab.tap()

        XCTAssert(tabBar.exists)

        let imageName = colorScheme == .light ? "JellyBelly" : "JellyBellyDark"

        let jellybellyImage = app.images[imageName]
        jellybellyImage.tap()

        XCTAssert(jellybellyImage.exists)



        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }



    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
