//
//  MenuDetailedView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 11/09/2022.
//

import SwiftUI

struct MenuDetailedView: View {
    var dish: Dish
    @EnvironmentObject var customerOrder: Order
    
    var body: some View {
        VStack {
            DishCircle(dishName: dish.name)
            DishInformationView(dish: dish)
            Spacer()
                .frame(height: 30.0)
            Button("Add to Order") {
                addToOrder(customerOrder: customerOrder, dish: dish)
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


struct MenuDetailedView_Previews: PreviewProvider {
    static private var customerOrder = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        MenuDetailedView(dish: testDish)
//        MenuDetailedView(dish: testDish)
    }
}
