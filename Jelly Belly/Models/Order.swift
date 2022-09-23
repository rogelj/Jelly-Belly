//
//  DataStructures.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/08/2022.
//

import Foundation
import UIKit

class Order: ObservableObject {
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

    /**
    Adds a `dish` to the order

     - Parameters:
         - dish: a`Dish` object

     - Returns: Adds the `dish` to the existing order

    */
    func addToOrder(dish: Dish) {
        order.append(dish)
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
}

