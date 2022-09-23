//
//  DataStructures.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/08/2022.
//

import Foundation
import UIKit

protocol OrderMemento {}

// I am using the Observer pattern in my Order class. The class is marked as an observable object and contains a
// a variable called `order` that using the @Published property wrapper so that it can be observed from
// within views elsewhere in the project. In this case the MenuDetailedView that adds items to an order,
// and the OrderView that displays the contents of the order itself.
class Order: ObservableObject, OrderMemento {
    @Published var order: [Dish] = []
    
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

