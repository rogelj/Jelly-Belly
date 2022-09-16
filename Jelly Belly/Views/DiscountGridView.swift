//
//  DiscountGridView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 16/09/2022.
//

import SwiftUI

struct DiscountGridView: View {
    
    @State var menuDishes = dishes
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    BigText(text: "Jelly Belly Discounts")
                        .padding()
                    Spacer()
                    RoundLogoView(imageSize: Constants.Logo.logoViewSizeTiny )
                        .padding()
                    
                }
                ScrollView {
                    ScrollViewReader { scrollProxy in
                        LazyVGrid(
                            columns: [.init(.adaptive(minimum: 150))]
                        ) {
                            ForEach(DishParts.MealCategory.allCases, id: \.self) { category in
                                Section(header: MenuHeaderView(title: category.rawValue)) {
                                    ForEach(Dish.getDiscountDishes(by: category)) { dish in
                                        NavigationLink(destination: MenuDetailedView(dish: dish)) {
                                            DishImage(dishName: dish.name)
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
}

struct DishImage: View {
    var dishName: String
    
    var body: some View {
        VStack{
            DishCircle(dishName: dishName)
            Text(dishName)
                .font(.body)
                .foregroundColor(Color("Belly"))
        }
    }
}

struct DiscountGridView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountGridView()
    }
}
