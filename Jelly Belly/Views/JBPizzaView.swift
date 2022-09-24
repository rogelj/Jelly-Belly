//
//  JBPizzaView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 24/09/2022.
//

import SwiftUI

struct JBPizzaView: View {
    private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColorIndex: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    BigText(text: "Jelly Belly Menu")
                        .padding()
                    Spacer()
                    RoundLogoView(imageSize: Constants.Logo.logoViewSizeTiny )
                        .padding()
                    
                }
                ScrollView {
                    LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                        VStack {
                            MenuHeaderView(title:"Protein: ")
                            Picker(selection: $selectedColorIndex, label: Text("Protein")) {
                                Text("(Can choose 1)")
                                ForEach(proteinIngredients, id: \.self, content: { protein in
                                    Text(protein.ingredients.ingredient)
                                })
                                
                            }
                        }.padding()
                        
                        VStack {
                            MenuHeaderView(title:"Sauce: ")
                            Picker(selection: $selectedColorIndex, label: Text("Sauce")) {
                                Text("(Can choose 1)")
                                ForEach(sauceIngredients, id: \.self, content: { sauce in
                                    Text(sauce.ingredients.ingredient)
                                })
                                
                            }
                        }.padding()
                        
                        VStack {
                            MenuHeaderView(title: "Cheese: ")
                            Picker(selection: $selectedColorIndex, label: Text("Cheese")) {
                                Text("(Can choose 1)")
                                ForEach(cheeseIngredients, id: \.self, content: { cheese in
                                    Text(cheese.ingredients.ingredient)
                                })
                                
                            }
                        }.padding()
                        

                        Section(header: MenuHeaderView(title: "Vegetable")) {
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
        JBPizzaView()
    }
}
