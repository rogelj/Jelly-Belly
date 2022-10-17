//
//  Tag+CoreDataProperties.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 17/10/2022.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    static func fetchOrCreateWith(
        title: String,
        in context: NSManagedObjectContext
    ) -> Tag {
        let request: NSFetchRequest<Tag> = fetchRequest()
        let predicate = NSPredicate(format: "%K == %@", "title", title.lowercased())
        request.predicate = predicate

        do {
            let results = try context.fetch(request)

            if let tag = results.first {
                return tag
            } else {
                let tag = Tag(context: context)
                tag.title = title.lowercased()
                return tag
            }
        } catch {
            fatalError("Error fetching tag")
        }
    }

    @NSManaged public var title: String?
    @NSManaged public var specials: Set<DishEntity>

}

// MARK: Generated accessors for specials
extension Tag {

    @objc(addSpecialsObject:)
    @NSManaged public func addToSpecials(_ value: DishEntity)

    @objc(removeSpecialsObject:)
    @NSManaged public func removeFromSpecials(_ value: DishEntity)

    @objc(addSpecials:)
    @NSManaged public func addToSpecials(_ values: NSSet)

    @objc(removeSpecials:)
    @NSManaged public func removeFromSpecials(_ values: NSSet)

}

extension Tag : Identifiable {

}
