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
//    @State private var selectedVegetable: Int
//
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
                        VStack {
                            MenuHeaderView(title:"Protein")
                            Picker(selection: $selectedProtein, label: Text("Protein")) {
                                ForEach(Proteins.allCases, content: { protein in
                                    Text(protein.rawValue.capitalized).tag(protein)
                                })

                            }
                        }.padding()
                        
                        VStack {
                            MenuHeaderView(title:"Sauce")
                            Picker(selection: $selectedSauce, label: Text("Sauce")) {
                                ForEach(Sauces.allCases, content: { sauce in
                                    Text(sauce.rawValue.capitalized)
                                })

                            }
                        }.padding()

                        VStack {
                            MenuHeaderView(title: "Cheese")
                            Picker(selection: $selectedCheese, label: Text("Cheese")) {
                                ForEach(Cheeses.allCases, content: { cheese in
                                    Text(cheese.rawValue.capitalized).tag(cheese)
                                })

                            }
                        }.padding()

                        Section(header: MenuHeaderView(title: "Vegetables")) {
                            ForEach(vegetableIngredients, id:\.self) { dish in
                                Text(dish.ingredients.ingredient)
                            }
                        }.padding(.leading)
                    }
                }
            }
        }
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
