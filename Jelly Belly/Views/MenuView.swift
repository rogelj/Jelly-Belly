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

    var downloader: MenuItems
    
//    @EnvironmentObject var customerOrder: Order
    @ObservedObject var orderCaretaker: OrderCaretaker
    
    var body: some View {
//        var menuDishes = downloader.myMenuDishes
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
                                ForEach(self.getMyDishes(by: category)) { dish in
                                    NavigationLink(destination: MenuDetailedView(dish: dish, orderCaretaker: orderCaretaker)) {
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

    func getMyDishes(by mealCategory: DishParts.MealCategory) -> [Dish] {
        downloader.myMenuDishes.filter { dish in
            dish.mealCategory == mealCategory
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

#if DEBUG
struct MenuView_Previews: PreviewProvider {
//    static private var menuSwiftUIIsShowing = Binding.constant(false)
//    static private var myMenuDishes = Binding.constant(Order(loadTestData: true))
    static private var downloader = MenuItems(loadTD: true)
    static private var orderCaretaker = OrderCaretaker()

    static var previews: some View {

        MenuView(downloader: downloader, orderCaretaker: orderCaretaker)
        MenuView(downloader: downloader,orderCaretaker: orderCaretaker)
            .preferredColorScheme(.dark)
        MenuView(downloader: downloader,orderCaretaker: orderCaretaker)
            .previewInterfaceOrientation(.landscapeLeft)
        MenuView(downloader: downloader,orderCaretaker: orderCaretaker)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
#endif
