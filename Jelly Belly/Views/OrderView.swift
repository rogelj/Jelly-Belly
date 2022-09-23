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
//    @EnvironmentObject var customerOrder: Order
    @ObservedObject var orderCaretaker: OrderCaretaker
    
    var body: some View {
        if orderCaretaker.order.isEmpty {
//        if customerOrder.order.isEmpty {
            VStack {
                BigText(text: "Order something and make your belly happy\n🥳🍽")
                    .padding()
            }
        } else {
            VStack(spacing: 5.0) {
                HeaderViewOrder()
                HStack {
                    VStack(spacing: 5.0) {
                        Text(String(format: "Total for Order: £%.2f",
                                    orderCaretaker.totalOrder(discounted: false)))
                        .bold()
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text(String(format: "Discounted: £%.2f",
                                    orderCaretaker.totalOrder(discounted: true)))
                        .bold()
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Enjoy your meal!")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    Button(action: {
                        orderCaretaker.clear()
                    }) {
                        Text("Clear Order")
                            .foregroundColor(Color("Belly"))
                            .bold()
                    }
                    .padding(.trailing)
                }
                
                ScrollView {
                    VStack() {
                        ForEach(orderCaretaker.order.indices, id: \.self) {
                            i in
                            DishOrderView(dish: orderCaretaker.order[i], orderCaretaker: orderCaretaker)
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
}

struct OrderView_Previews: PreviewProvider {
    static private var testOrder = Order(loadTestData: true)
    static private var orderCaretaker = OrderCaretaker(loadTestData: true)
//    let orderCaretaker.order = dishes
    
    static var previews: some View {
        OrderView(orderCaretaker: orderCaretaker)
        OrderView(orderCaretaker: orderCaretaker)
            .preferredColorScheme(.dark)
        OrderView(orderCaretaker: orderCaretaker)
            .previewInterfaceOrientation(.landscapeLeft)
        OrderView(orderCaretaker: orderCaretaker)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
