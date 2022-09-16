//
//  ContentView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    
    var menuDishes = dishes

    var body: some View {
        TabView(selection: $tabSelection) {
            WelcomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
         
            MenuView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Menu")
                }
                .tag(1)
         
            DiscountGridView()
                .tabItem {
                    Image(systemName: "gift")
                    Text("Discounts")
                }
                .tag(2)
         
            Text("Order")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "cart")
                    Text("Order")
                }
                .tag(3)
        }
        .accentColor(Color("Belly"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static private var testOrder = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
