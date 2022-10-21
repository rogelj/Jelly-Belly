//
//  Jelly_BellyCoreDataTests.swift
//  Jelly BellyTests
//
//  Created by J Rogel PhD on 21/10/2022.
//

import XCTest
@testable import Jelly_Belly

final class Jelly_BellyCoreDataTests: XCTestCase {
    let coreDataStore = CoreDataStore(.inMemory)


    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SaveCoreData() {
        //Given
        let dish1 = testDish
        let context = coreDataStore.persistentContainer.newBackgroundContext()

        let entity = DishEntity(context: context)
        entity.name = dish1.name
        entity.cuisine = dish1.cuisine
        entity.cost = dish1.cost
        entity.special = dish1.special!
        entity.discountable = dish1.discountable!
        entity.dishDescription = dish1.description

        do {
            try context.save()
            print("Success saving to core data")
        } catch {
            print("Error saving to core data")
            print(error.localizedDescription)
        }

    }

}
