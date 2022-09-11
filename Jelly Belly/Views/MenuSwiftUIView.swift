//
//  DishView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 11/09/2022.
//

import SwiftUI

struct HeaderViewMenu: View {
    @Binding var menuSwiftUIIsShowing: Bool
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
            HStack {
                Spacer()
                Button(action: {
                    menuSwiftUIIsShowing = false
                }) {
                    Text("Done")
                        .bold()
                        .foregroundColor(Color("Belly"))
                }
                .padding(.all)
            }
            HStack(spacing: 20.0) {
                BigText(text: "Jelly Belly Menu")
                Spacer()
                RoundLogoView(imageSize: Constants.Logo.logoViewSizeSmall)
            }
            .padding(.all)
        } else {
            Spacer()
                .frame(height: 0.5)
            HStack {
                BigText(text: "Jelly Belly Menu")
                    .padding(.leading)
                Spacer()
                RoundLogoView(imageSize: Constants.Logo.logoViewSizeSmall)
                Spacer()
                Button(action: {
                    menuSwiftUIIsShowing = false
                }) {
                    Text("Done")
                        .bold()
                        .foregroundColor(Color("Belly"))
                }
                .padding(.trailing)
            }
        }
    }
}

/**
 Main Order view
 */
struct MenuSwiftUIView: View {
    @State var menuDishes = dishes
    @Binding var menuSwiftUIIsShowing: Bool
    @Binding var customerOrder: Order
    
    var body: some View {
        VStack {
            HeaderViewMenu(menuSwiftUIIsShowing: $menuSwiftUIIsShowing)
            NavigationView {
                List(menuDishes) { dish in
                    NavigationLink(destination: Text(dish.name)) {
                        MenuRowView(dish: dish)
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct MenuSwiftUIView_Previews: PreviewProvider {
    static private var menuSwiftUIIsShowing = Binding.constant(false)
    static private var testOrder = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        MenuSwiftUIView(menuSwiftUIIsShowing: menuSwiftUIIsShowing, customerOrder: testOrder)
        MenuSwiftUIView(menuSwiftUIIsShowing: menuSwiftUIIsShowing, customerOrder: testOrder)
            .preferredColorScheme(.dark)
        MenuSwiftUIView(menuSwiftUIIsShowing: menuSwiftUIIsShowing, customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
        MenuSwiftUIView(menuSwiftUIIsShowing: menuSwiftUIIsShowing, customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
