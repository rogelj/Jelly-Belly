//
//  DataStructures.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/08/2022.
//

import Foundation
import UIKit

// I am using a Memento pattern to be able to add, remove and clear the order stack.
// The Originator is implemented in Models > OrderMemento > OrderOriginator.swift
// The Caretaker is implemented in Models > OrderMemento > OrderCaretakes.swift 
protocol OrderMemento {}

class Order: OrderMemento {
    var order: [Dish] = []
    
    init(order: [Dish]) {
        self.order = order
    }
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            // Loading test data - now stored in `Dishes.swift`
            order = dishes
        }
    }
}

