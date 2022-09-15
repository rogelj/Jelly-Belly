//
//  MenuExamples.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 10/09/2022.
//

import SwiftUI

struct MenuExamples: View {
    @State private var orderIsShowing = false
    @State private var menuUIKitIsShowing = false
    @State private var menuStoryIsShowing = false
    @State private var menuSwiftUIIsShowing = false
    
    @Binding var menuExamplesIsShowing: Bool
    @Binding var customerOrder: Order
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button (action: {
                    menuExamplesIsShowing.toggle()
                }) {
                    Text("Done")
                        .bold()
                        .foregroundColor(Color("Belly"))
                }
                .padding()
            }
            Spacer()
            ZStack {
                VStack(spacing: 12) {
                    
                    // Existing Order View
                    Button( action: {
                        orderIsShowing = true
                    }) {
                        Text("Order")
                            .bold()
                            .foregroundColor(Color("Jelly"))
                    }.sheet(isPresented: $orderIsShowing, onDismiss: {}, content: {
                        OrderView(orderIsShowing: $orderIsShowing, customerOrder: $customerOrder)
                    })
                    
                    // SwiftUI
                    Button( action: {
                        menuSwiftUIIsShowing = true
                    }) {
                        Text("Menu - SwiftUI")
                            .bold()
                            .foregroundColor(Color("Jelly"))
                    }.sheet(isPresented: $menuSwiftUIIsShowing, onDismiss: {}, content: {
                        MenuView(menuSwiftUIIsShowing: $menuSwiftUIIsShowing)
                    })
                    
                    // Storyboard
                    Button( action: {
                        menuStoryIsShowing = true
                    }) {
                        Text("Menu - UIKIT")
                            .bold()
                            .foregroundColor(Color("Jelly"))
                    }.sheet(isPresented: $menuStoryIsShowing, onDismiss: {}, content: {
                        MenuUITableView(menuStoryIsShowing: $menuStoryIsShowing)
                    })
                    
                    // Programmatic
                    Button( action: {
                        menuUIKitIsShowing = true
                    }) {
                        Text("Menu - UIKit UList")
                            .bold()
                            .foregroundColor(Color("Jelly"))
                    }.sheet(isPresented: $menuUIKitIsShowing, onDismiss: {}, content: {
                        MenuUIListView(menuUIKitIsShowing: $menuUIKitIsShowing)
                    })
                }
            }
            Spacer()
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
