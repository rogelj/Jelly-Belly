//
//  Jelly_BellyAsynchTests.swift
//  Jelly BellyTests
//
//  Created by J Rogel PhD on 20/10/2022.
//

import XCTest
@testable import Jelly_Belly


final class Jelly_BellyAsynchTests: XCTestCase {

    let timeout: TimeInterval = 2
    let timeout10: TimeInterval = 10
    var expectation: XCTestExpectation!

    var myMenu = MenuItems()

    override func setUp() {
        expectation = expectation(description: "Server responds in reasonable time")
    }

    func test_noServerResponse() {
        let url = URL(string: "norestaurant")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { self.expectation.fulfill() }

            XCTAssertNil(data)
            XCTAssertNil(response)
            XCTAssertNotNil(error)
        }
        .resume()

        waitForExpectations(timeout: timeout)
    }

    func test_decodeDish() {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=b")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { self.expectation.fulfill() }

            XCTAssertNil(error)

            do {
                let response = try XCTUnwrap(response as? HTTPURLResponse)
                XCTAssertEqual(response.statusCode, 200)

                let data = try XCTUnwrap(data)
                XCTAssertNoThrow(
                    try JSONDecoder().decode(MenuItems.TheMealDB.self, from: data)
                )
            } catch { }
        }
        .resume()

        waitForExpectations(timeout: timeout10)
    }

    func test_decodeOddDish() {
        struct OddDish: Decodable {
            let id: String
            let name: String
            let region : String
        }
        let url = URL(string: "http://foodbukka.herokuapp.com/api/v1/menu")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { self.expectation.fulfill() }

            XCTAssertNil(error)
            XCTAssertEqual(
                (response as? HTTPURLResponse)?.statusCode,
                200
            )

            do {
                _ = try JSONDecoder().decode(
                    MenuItems.TheMealDB.self,
                    from: try XCTUnwrap(data)
                )
            } catch {
                switch error {
                case DecodingError.keyNotFound(let key, _):
                    XCTAssertEqual(key.stringValue, "region")
                default:
                    XCTFail("\(error)")
                }
            }
        }
        .resume()

        waitForExpectations(timeout: timeout)
    }

    func test_404() {
        let url = URL(string: "https://jrogel.com/mine")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { self.expectation.fulfill() }

            XCTAssertNil(error)
            do {
                let response = try XCTUnwrap(response as? HTTPURLResponse)
                XCTAssertEqual(response.statusCode, 404)

                let data = try XCTUnwrap(data)
                XCTAssertThrowsError(
                    try JSONDecoder().decode([Dish].self, from: data)
                ) { error in
                    guard case DecodingError.dataCorrupted = error else {
                        XCTFail("\(error)")
                        return
                    }
                }
            } catch { }
        }
        .resume()

        waitForExpectations(timeout: timeout10)
    }

}

