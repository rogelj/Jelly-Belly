//
//  MenuDetailedView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 11/09/2022.
//

import SwiftUI

struct MenuDetailedView: View {
    var dish: Dish
    @ObservedObject var orderCaretaker: OrderCaretaker
    
    var body: some View {
        VStack {
            DishCircle(dishName: dish.name)
            DishInformationView(dish: dish)
            Spacer()
                .frame(height: 30.0)
            Button("Add to Order") {
                addToOrder(orderCaretaker: orderCaretaker, dish: dish)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .padding().navigationBarTitle(Text(dish.name), displayMode: .inline)
    }
}

struct MenuCDDetailedView: View {
    var dish: DishEntity
    @ObservedObject var orderCaretaker: OrderCaretaker

    var body: some View {
        VStack {
            DishCircle(dishName: dish.name)
            DishInformationCDView(dish: dish)
            Spacer()
                .frame(height: 30.0)
//            Button("Add to Order") {
//                addToOrder(orderCaretaker: orderCaretaker, dish: dish)
//            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .padding().navigationBarTitle(Text(dish.name), displayMode: .inline)
    }
}


struct MenuDetailedView_Previews: PreviewProvider {
//    static private var customerOrder = Binding.constant(Order(loadTestData: true))
    static private var orderCaretaker = OrderCaretaker()
    
    static var previews: some View {
        MenuDetailedView(dish: testDish, orderCaretaker: orderCaretaker)
    }
}
