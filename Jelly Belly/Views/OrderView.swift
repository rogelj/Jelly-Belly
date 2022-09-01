//
//  DishView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/08/2022.
//

import SwiftUI

struct HeaderViewOrder: View {
    @Binding var orderIsShowing: Bool
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
            HStack {
                Spacer()
                Button(action: {
                    orderIsShowing = false
                }) {
                    Text("Done")
                        .bold()
                        .foregroundColor(Color("Belly"))
                }
                .padding(.all)
            }
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
                Button(action: {
                    orderIsShowing.toggle()
                }) {
                    Text("Done")
                        .bold()
                }
                .padding(.trailing)
            }
        }
    }
}

/**
 Main Order view
 */
struct OrderView: View {
    @Binding var orderIsShowing: Bool
    @Binding var customerOrder: Order
    
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderViewOrder(orderIsShowing: $orderIsShowing)
            Text(String(format: "Total: £%.2f", customerOrder.totalOrder()))
                .bold()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Enjoy your meal!")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(customerOrder.order.indices, id: \.self) {
                        i in
                        DishView(dish: customerOrder.order[i])
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
    static private var orderIsShowing = Binding.constant(false)
    static private var testOrder = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        OrderView(orderIsShowing: orderIsShowing, customerOrder: testOrder)
        OrderView(orderIsShowing: orderIsShowing, customerOrder: testOrder)
            .preferredColorScheme(.dark)
        OrderView(orderIsShowing: orderIsShowing, customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
        OrderView(orderIsShowing: orderIsShowing, customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
