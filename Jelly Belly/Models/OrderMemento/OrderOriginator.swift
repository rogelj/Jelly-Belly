//
//  OrderOriginator.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 23/09/2022.
//

import SwiftUI
import Combine

class OrderOriginator {
    @Published private(set) var orderState = [Dish]()
    
    func removeDish() {
        guard !orderState.isEmpty else {
            return
        }
        orderState.removeLast()
    }
    
    func resetState() {
        orderState = []
    }
    
    func addOrderItem(dish: Dish) {
        orderState.append(dish)
    }
        
    func createMemento() -> OrderMemento {
        return Order(order: orderState)
    }
    
    func restoreMemento(orderMemento: any OrderMemento) {
        guard let order = orderMemento as? Order else { return }
        orderState = order.order
    }
}
    
