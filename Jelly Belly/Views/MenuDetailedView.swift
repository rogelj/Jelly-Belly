//
//  MenuDetailedView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 11/09/2022.
//

import SwiftUI

struct DishInformation: View {
    var dish: Dish
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                if dish.special != nil && dish.special == true {
                    VStack(alignment: .leading){
                        Text("Special")
                            .foregroundColor(Color("Jelly"))
                            .font(.headline)
                    }
                    Spacer()
                }
            }
            HStack {
                if dish.discountable != nil && dish.discountable == true {
                    Text("Seasonal discount available")
                        .foregroundColor(Color("Belly"))
                        .font(.headline)
                }
                Spacer()
            }
            HStack(alignment: .top) {
                VStack {
                    DishItemText(text: "Ingredients:")
                        .bold()
                    ForEach(dish.ingredients.indices, id: \.self) {
                        i in DishItemText(text: "\(dish.ingredients[i].ingredient)")
                    }
                }
                VStack{
                    DishItemText(text: "Cuisine:")
                        .bold()
                    DishItemText(text: dish.cuisine)
                }
            }
            Spacer()
                .frame(height: 5.0)
            HStack(alignment: .top) {
                VStack {
                    DishItemText(text: "Calories:")
                        .bold()
                    DishItemText(text: "\(dish.getCalories())")
                }
                VStack {
                    if let isDietary = dish.dietary {
                        VStack{
                            DishItemText(text: "Dietary Requirement:")
                                .bold()
                            DishItemText(text: isDietary)
                            Spacer()
                                .frame(height: 5.0)
                        }
                    }
                }
            }
            HStack(alignment: .top) {
                VStack {
                    DishItemText(text: "Cost:")
                        .bold()
                    DishItemText(text: "£\(dish.cost)")
                }
                VStack {
                    if dish.discountable != nil && dish.discountable == true {
                        DishItemText(text: "Discounted Cost")
                            .bold()
                        DishItemText(text: "£\(dish.finalCost)")
                    }
                }
            }
        }
    }
}

struct MenuDetailedView: View {
    var dish: Dish
    
    var body: some View {
        VStack {
            Image(dish.name)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color("Jelly"), lineWidth: 4)
                )
                .shadow(radius: 10)
            Text(dish.name)
                .font(.title)
                .foregroundColor(Color("Belly"))
            DishInformation(dish: dish)

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .padding().navigationBarTitle(Text(dish.name), displayMode: .inline)
    }
}

struct MenuDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailedView(dish: testDish)
    }
}
