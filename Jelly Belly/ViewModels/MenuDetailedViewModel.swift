//
//  MenuDetailedViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 23/09/2022.
//

import UIKit

func addToOrder(orderCaretaker: OrderCaretaker, dish: Dish) {
    orderCaretaker.addOrderItem(dish: dish)
    orderCaretaker.printOrder()
    
}
