//
//  ContentView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var context

    @ObservedObject var downloader = MenuItems()

    @State private var showSplash = true
    @State private var tabSelection = 1
    @StateObject var orderCaretaker = OrderCaretaker()

    @EnvironmentObject var imageLoader: ImageLoader
    @EnvironmentObject var network: Network

    var body: some View {
        if network.connected {
            if !showSplash {
                TabView(selection: $tabSelection) {
                    WelcomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                        .tag(0)

                    MenuView(downloader: downloader, orderCaretaker: orderCaretaker)
                        .tabItem {
                            Image(systemName: "fork.knife")
                            Text("Menu")
                        }
                        .tag(1)

                    //                DiscountGridView(downloader: downloader, orderCaretaker: orderCaretaker)
                    //                    .tabItem {
                    //                        Image(systemName: "gift")
                    //                        Text("Discounts")
                    //                    }
                    //                    .tag(1)

                    JBPizzaView(orderCaretaker: orderCaretaker)
                        .tabItem {
                            Image(systemName: "chart.pie")
                            Text("JB Pizza")
                        }
                        .tag(2)
                    CoreDataView(orderCaretaker: orderCaretaker)
                        .tabItem {
                            Image(systemName: "heart.square.fill")
                            Text("Specials")
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
                            try await downloader.loadData(context: context)
                            
//                            downloader.saveData(context: context)
                            try await ImageDatabase.shared.setUp()
                        }
                    })
            }
        } else {
            VStack {
                BigText(text: "Please check your internet connection")
                    .padding()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static private var testOrder = Binding.constant(Order(loadTestData: true))

    static var previews: some View {
        ContentView()
            .environmentObject(Network())
            .environmentObject(ImageLoader())
        ContentView()
            .environmentObject(Network())
            .environmentObject(ImageLoader())
            .preferredColorScheme(.dark)
        ContentView()
            .environmentObject(Network())
            .environmentObject(ImageLoader())
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .environmentObject(Network())
            .environmentObject(ImageLoader())
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
#endif
