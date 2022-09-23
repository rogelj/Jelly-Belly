//
//  MenuDetailedViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 23/09/2022.
//

import UIKit

func addToOrder(customerOrder: Order, dish: Dish) {
    customerOrder.addToOrder(dish: dish)
    customerOrder.printOrder()
}
