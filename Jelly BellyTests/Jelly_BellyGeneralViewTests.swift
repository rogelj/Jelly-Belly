//
//  Jelly_BellyGeneralViewTests.swift
//  Jelly BellyTests
//
//  Created by J Rogel PhD on 20/10/2022.
//

import XCTest
@testable import Jelly_Belly

final class Jelly_BellyGeneralViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Greeting() {
        let name = "Bowman"
        let myGreet = greeting(userName: name)
        XCTAssertEqual(myGreet, "Welcome to Bowman")
    }

}
