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
            GeometryReader { proxy in
                ZStack(alignment: .topTrailing) {
                    DishCircle(dishName: dishName)
                    Image(systemName: "exclamationmark.bubble.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color("Belly"))
                        .background(Color.white.opacity(0.5))
                        .frame(width: proxy.size.width / 4, height: proxy.size.height / 5)
                        .padding(proxy.size.width / 30)
                }
            }
            .frame(width: 100, height: 100)
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
