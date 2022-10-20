//
//  Test.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 23/09/2022.
//

import SwiftUI
import Combine

// I am using the Observer pattern in my OrderCaretaker class. The class is marked as an observable object and contains a
// a variable called `order` that using the @Published property wrapper so that it can be observed from
// within views elsewhere in the project.
// In this case the ContentView marks an object of class OrderCaretaker as State Object, and this is observed by
// MenuView, MenuDetailedView and OrderView to be able to adds items to an order, get items out or clear things
// with the a Memento Pattern implementation. 
class OrderCaretaker: ObservableObject {
    
    @Published private(set) var order = [Dish]()
    private var orderMementoStack = [any OrderMemento]()
    private let orderOriginator = OrderOriginator()
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = orderOriginator
            .$orderState
            .assign(to: \.order, on: self)
    }
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            // Loading test data - now stored in `Dishes.swift`
            order = dishes1
        }
    }
    
    func addOrderItem(dish: Dish) {
        orderOriginator.addDish(dish: dish)
        
        let orderMemento = orderOriginator.createMemento()
        
        orderMementoStack.append(orderMemento)
    }
    
    func removeOrderItem(dish: Dish) {
        orderOriginator.removeDish(dish: dish)
        
        let orderMemento = orderOriginator.createMemento()
        
        orderMementoStack.append(orderMemento)
    }
    
    func clear() {
        orderOriginator.resetState()
        let orderMemento = orderOriginator.createMemento()
        orderMementoStack.append(orderMemento)
    }
    
    func undo() {
        guard !orderMementoStack.isEmpty else {
            return
        }
        
        orderMementoStack.removeLast()
        
        guard let lastOrderItemList = orderMementoStack.last else {
            orderOriginator.resetState()
            return
        }
        
        orderOriginator.restoreMemento(orderMemento: lastOrderItemList)
    }
}

extension OrderCaretaker {
    /**
     Calculates the total cost of an `order` based on actual cost

     - Parameters:
     - discounted: Bool - Use discounted prices

     - Returns: `total`, the total cost of the dished in the order

     */
    func totalOrder(discounted: Bool) -> Double {
        var total: Double = 0.0
        for entry in order {
            if discounted {
                total += entry.finalCost
            } else {
                total += entry.cost
            }
        }
        return total
    }
    
    /**
    Prints the dishes in the order

     - Parameters:
         - order: an Array of `Dish` objects

     - Returns: Prints to the console

    */
    func printOrder() {
        Swift.print("=== YOUR ORDER ===")
        for entry in order {
            Swift.print("Name: \(entry.name)")
        }
        Swift.print("===\n")
    }
    
    /**
    Prints the dishes that are marked as `special` in an order

     - Parameters:
         - order: an Array of `Dish` objects

     - Returns: Prints to the console

    */
    func printSpecials() {
        for entry in order {
            if let special = entry.special {
                Swift.print("===")
                Swift.print("Name: \(entry.name)")
                Swift.print("Ingredients:")
                for ingredient in entry.ingredients {
                    Swift.print("- \(ingredient.ingredient)")
                }
                Swift.print("Cusine: \(entry.cuisine)")
                Swift.print("Cost: \(entry.cost)")
                Swift.print("Special: \(special)")
                Swift.print("===\n")
            }
        }
    }


    /**
     Prints the dishes that are marked as having a dietary requirement in an order

     - Parameters:
     - order: an Array of `Dish` objects

     - Returns: Prints to the console

     */
    func printDietaryDishes() {
        for entry in order {
            if let dietary = entry.dietary {
                Swift.print("===")
                Swift.print("Name: \(entry.name)")
                Swift.print("Ingredients:")
                for ingredient in entry.ingredients {
                    print("- \(ingredient.ingredient)")
                }
                Swift.print("Cusine: \(entry.cuisine)")
                Swift.print("Cost: \(entry.cost)")
                Swift.print("Dietary: \(dietary)")
                Swift.print("===\n")
            }
        }
    }
}
