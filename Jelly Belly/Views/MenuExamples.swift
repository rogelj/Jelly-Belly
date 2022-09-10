//
//  MenuExamples.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 10/09/2022.
//

import SwiftUI

struct MenuExamples: View {
    @Binding var menuExamplesIsShowing: Bool
    @State private var orderIsShowing = false
    @Binding var customerOrder: Order
    
    var body: some View {
        VStack {
            Button( action: {
                orderIsShowing = true
            }) {
                Text("Order")
                    .bold()
                    .foregroundColor(Color("Jelly"))
            }.sheet(isPresented: $orderIsShowing, onDismiss: {}, content: {
                OrderView(orderIsShowing: $orderIsShowing, customerOrder: $customerOrder)
            })
            JellyBellyButton(message: "UIKit Menu")
            JellyBellyButton(message: "SwiftUI Menu")
            JellyBellyButton(message: "Storyboard")
            Button (action: {
                menuExamplesIsShowing.toggle()
            }) {
                Text("Done")
                    .bold()
                    .foregroundColor(Color("Belly"))
            }
            
        }
    }
}

struct MenuExamples_Previews: PreviewProvider {
    static private var menuExamplesIsShowing = Binding.constant(false)
    static private var testOrder = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        MenuExamples(menuExamplesIsShowing: menuExamplesIsShowing, customerOrder: testOrder)
        MenuExamples(menuExamplesIsShowing: menuExamplesIsShowing, customerOrder: testOrder)
            .preferredColorScheme(.dark)
        MenuExamples(menuExamplesIsShowing: menuExamplesIsShowing, customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
        MenuExamples(menuExamplesIsShowing: menuExamplesIsShowing, customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
