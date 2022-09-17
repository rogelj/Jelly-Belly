//
//  DishView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/08/2022.
//

import SwiftUI

struct HeaderViewOrder: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
            HStack(spacing: 20.0) {
                BigText(text: "Your Order")
                Spacer()
                RoundLogoView(imageSize: Constants.Logo.logoViewSizeSmall)
            }
            .padding(.all)
        } else {
            Spacer()
                .frame(height: 0.5)
            HStack {
                BigText(text: "Your Order")
                    .padding(.leading)
                Spacer()
                RoundLogoView(imageSize: Constants.Logo.logoViewSizeSmall)
                Spacer()
            }
        }
    }
}

/**
 Main Order view
 */
struct OrderView: View {
    @Binding var customerOrder: Order
    
    var body: some View {
        VStack(spacing: 5.0) {
            HeaderViewOrder()
            Text(String(format: "Total for Order: £%.2f", customerOrder.totalOrder(discounted: false)))
                .bold()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(String(format: "Discounted: £%.2f", customerOrder.totalOrder(discounted: true)))
                .bold()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Enjoy your meal!")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            ScrollView {
                VStack() {
                    ForEach(customerOrder.order.indices, id: \.self) {
                        i in
                        DishOrderView(dish: customerOrder.order[i])
                            .padding(.trailing)
                            .padding(.leading)
                    }
                }
            }
            Spacer()
                .frame(height: 0.1)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static private var testOrder = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        OrderView(customerOrder: testOrder)
        OrderView(customerOrder: testOrder)
            .preferredColorScheme(.dark)
        OrderView(customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
        OrderView(customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
