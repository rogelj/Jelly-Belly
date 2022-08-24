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
                    orderIsShowing = false
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
    @Binding var order: Order
    
    let featuresToBuild = ["The app shows a menu as a list",
                       "Menu list is fetched from an API and saved in the app",
                       "Users can choose menu items and add them to their order",
                       "Upon placing an order, users can select or add a tip",
                       "Upon checkout, total amount will be calculated",
                       "Users can write a review of the menu item and add a photo of the dish"]
    
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderViewOrder(orderIsShowing: $orderIsShowing)
            Text("Enjoy your meal!")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(order.order.indices, id: \.self) {
                        i in
                        Text(order.order[i].name)
//                        MyRowView(index: i+1, text: order[i])
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
    static private var order = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        OrderView(orderIsShowing: orderIsShowing, order: order)
        OrderView(orderIsShowing: orderIsShowing, order: order)
            .preferredColorScheme(.dark)
        OrderView(orderIsShowing: orderIsShowing, order: order)
            .previewInterfaceOrientation(.landscapeLeft)
        OrderView(orderIsShowing: orderIsShowing, order: order)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
