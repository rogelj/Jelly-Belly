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
    
    func resetState() {
        orderState = []
    }
    
    func addDish(dish: Dish) {
        orderState.append(dish)
    }
    
    func removeDish(dish: Dish) {
        if let index = orderState.firstIndex(where: {$0.id == dish.id }) {
            orderState.remove(at: index)
        }
    }
    
    func removeLastDish() {
        guard !orderState.isEmpty else {
            return
        }
        orderState.removeLast()
    }
        
    func createMemento() -> OrderMemento {
        return Order(order: orderState)
    }
    
    func restoreMemento(orderMemento: any OrderMemento) {
        guard let order = orderMemento as? Order else { return }
        orderState = order.order
    }
}
    
