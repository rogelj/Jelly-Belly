//
//  OrderViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 23/09/2022.
//

import SwiftUI

func removeFromOrder(orderCaretaker: OrderCaretaker, dish: Dish) {
    orderCaretaker.removeOrderItem(dish: dish)
    orderCaretaker.printOrder()
}
