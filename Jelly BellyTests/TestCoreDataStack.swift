//
//  TestCoreDataStack.swift
//  Jelly BellyTests
//
//  Created by J Rogel PhD on 21/10/2022.
//

import Foundation
import CoreData


//class TestCoreDataStack {
//    lazy var persistentContainer: NSPersistentContainer = {
//        let description = NSPersistentStoreDescription()
//        description.url = URL(fileURLWithPath: "/dev/null")
//        let container = NSPersistentContainer(name: "Jelly_Belly")
//        container.persistentStoreDescriptions = [description]
//        container.loadPersistentStores { _, error in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//        return container
//    }()
//}

enum StorageType {
    case persistent, inMemory
}

class CoreDataStore {
    let persistentContainer: NSPersistentContainer

    init(_ storageType: StorageType = .persistent) {
        self.persistentContainer = NSPersistentContainer(name: "YourDataStore")

        if storageType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            self.persistentContainer.persistentStoreDescriptions = [description]
        }

        self.persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
