//
//  JBPizzaView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/09/2022.
//

import SwiftUI

struct JBPizzaView: View {
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
                
                ScrollView {
                    LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                        HStack {
                            BuilderHeaderView(title: "Protein")
                            Picker(selection: $selectedProtein, label: Text("Protein")) {
                                ForEach(Proteins.allCases, content: { protein in
                                    Text(protein.rawValue.capitalized).tag(protein)
                                })
                            }
                            Spacer()
                        }
                        .padding()
                        
                        HStack {
                            BuilderHeaderView(title:"Sauce")
                            Picker(selection: $selectedSauce, label: Text("Sauce")) {
                                ForEach(Sauces.allCases, content: { sauce in
                                    Text(sauce.rawValue.capitalized).tag(sauce)
                                })
                            Spacer()
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
                            }.padding()
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
    static var previews: some View {
//        static private var selectedProtein = Binding.constant(0)
//        static private var selectedSauce = Binding.constant(0)
//        static private var selectedCheese = Binding.constant(0)
//        static private var selectedVegetable = Binding.constant(0)
        
        JBPizzaView()
    }
}
