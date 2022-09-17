//
//  MenuView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 11/09/2022.
//

import SwiftUI

struct HeaderViewMenu: View {
    @Binding var menuIsShowing: Bool
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
            HStack {
                Spacer()
                Button(action: {
                    menuIsShowing = false
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
                    menuIsShowing = false
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
 Menu view
 */
struct MenuView: View {
    @State var menuDishes = dishes
    @Binding var customerOrder: Order
    
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
                        ForEach(DishParts.MealCategory.allCases, id: \.self) { category in
                            Section(header: MenuHeaderView(title: category.rawValue)) {
                                ForEach(Dish.getDishes(by: category)) { dish in
                                    NavigationLink(destination: MenuDetailedView(dish: dish, customerOrder: $customerOrder)) {
                                        MenuRowView(dish: dish)
                                            .padding(.leading)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MenuHeaderView: View {
    var title: String
    
    var body: some View {
        MediumText(text: title)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
    }
}


struct MenuView_Previews: PreviewProvider {
    static private var menuSwiftUIIsShowing = Binding.constant(false)
    static private var testOrder = Binding.constant(Order(loadTestData: true))
    
    static var previews: some View {
        MenuView(customerOrder: testOrder)
        MenuView(customerOrder: testOrder)
            .preferredColorScheme(.dark)
        MenuView(customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
        MenuView(customerOrder: testOrder)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
