//
//  ContentView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var downloader = MenuItems()

    @State private var showSplash = true
    @State private var tabSelection = 1
    @StateObject var orderCaretaker = OrderCaretaker()

    var body: some View {
        if !showSplash {
            TabView(selection: $tabSelection) {
                WelcomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                MenuView(orderCaretaker: orderCaretaker)
                    .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Menu")
                    }
                    .tag(1)
                
//                DiscountGridView(orderCaretaker: orderCaretaker)
                MenuAPIView(downloader: downloader)
                    .tabItem {
                        Image(systemName: "gift")
                        Text("Discounts")
                    }
                    .tag(2)
                
                JBPizzaView(orderCaretaker: orderCaretaker)
                    .tabItem {
                        Image(systemName: "chart.pie")
                        Text("JB Pizza")
                    }
                    .tag(3)
                
                OrderView(orderCaretaker: orderCaretaker)
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Order")
                    }
                    .tag(4)
            }
            .accentColor(Color("Belly"))
        } else {
            SplashScreen()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        SplashScreen.shouldAnimate = false
                        withAnimation() {
                            self.showSplash = false
                        }
                    }
                }
                .onAppear(perform: {
                    Task {
                        try await downloader.loadData()
//                        try await downloader.getRayCookie()
                    }
                })
        }
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
