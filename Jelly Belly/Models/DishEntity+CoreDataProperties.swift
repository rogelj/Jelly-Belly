//
//  DishEntity+CoreDataProperties.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 14/10/2022.
//
//

import Foundation
import CoreData
import SwiftUI

extension DishEntity {

    static func createWith(
        name: String,
        cuisine: String,
        cost: Double,
        special: Bool,
        discountable: Bool,
        dishDescription: String,
        tags: Set<Tag> = [],
        using managedObjectContext: NSManagedObjectContext
    ) {
        let myMenuDish = DishEntity(context: managedObjectContext)
        myMenuDish.name = name
        myMenuDish.cuisine = cuisine
        myMenuDish.cost = cost
        myMenuDish.special = special
        myMenuDish.discountable = discountable
        myMenuDish.dishDescription = dishDescription
        myMenuDish.tags = tags

        do {
            try managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    @NSManaged public var name: String
    @NSManaged public var cuisine: String
    @NSManaged public var cost: Double
    @NSManaged public var special: Bool
    @NSManaged public var discountable: Bool
    @NSManaged public var dishDescription: String
    @NSManaged public var tags: Set<Tag>?

}

extension DishEntity : Identifiable {

}
