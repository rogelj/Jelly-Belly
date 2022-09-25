//
//  JBPizzaView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/09/2022.
//

import SwiftUI

struct JBPizzaView: View {
    @ObservedObject var orderCaretaker: OrderCaretaker
    
    @State private var selectedProtein: Proteins = .none
    @State private var selectedSauce: Sauces = .none
    @State private var selectedCheese: Cheeses = .mozarella
    @State private var selectedVeggies: [Vegetables] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    BigText(text: "Jelly Belly Pizza")
                        .padding()
                    Spacer()
                    RoundLogoView(imageSize: Constants.Logo.logoViewSizeTiny )
                        .padding()
                }
                Spacer()
                    .frame(height: 30.0)
                Button("Add to Order") {
                    buildJBPizza(protein: selectedProtein, sauce: selectedSauce, cheese: selectedCheese, veggies: selectedVeggies, orderCaretaker: orderCaretaker)
                }
                ScrollViewReader { scrollProxy in
                    ScrollView {
                        LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                            HStack {
                                BuilderHeaderView(title: "Protein")
                                Picker(selection: $selectedProtein, label: Text("Protein")) {
                                    ForEach(Proteins.allCases, content: { protein in
                                        Text(protein.rawValue.capitalized).tag(protein)
                                    })
                                }
                            }
                            .padding()
                            
                            HStack {
                                BuilderHeaderView(title:"Sauce")
                                Picker(selection: $selectedSauce, label: Text("Sauce")) {
                                    ForEach(Sauces.allCases, content: { sauce in
                                        Text(sauce.rawValue.capitalized).tag(sauce)
                                    })
                                }
                            }
                            .padding()
                            
                            HStack {
                                BuilderHeaderView(title: "Cheese")
                                Picker(selection: $selectedCheese, label: Text("Cheese")) {
                                    ForEach(Cheeses.allCases, content: { cheese in
                                        Text(cheese.rawValue.capitalized).tag(cheese)
                                    })
                                    
                                }
                            }
                            .padding()
                            
                            Section(header: MenuHeaderView(title: "Vegetables")) {
                                LazyVGrid(
                                    columns: [.init(.adaptive(minimum: 150))]
                                ) {
                                    ForEach(Vegetables.allCases) { veggie in
                                        GridRow(item: veggie, items: $selectedVeggies)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}


struct BuilderHeaderView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(Color("Belly"))
            .font(.title2)
            .bold()
            .multilineTextAlignment(.center)
    }
}

struct JBPizzaView_Previews: PreviewProvider {
    static private var orderCaretaker = OrderCaretaker()
    
    static var previews: some View {
        JBPizzaView(orderCaretaker: orderCaretaker)
        JBPizzaView(orderCaretaker: orderCaretaker)
            .preferredColorScheme(.dark)
    }
}
