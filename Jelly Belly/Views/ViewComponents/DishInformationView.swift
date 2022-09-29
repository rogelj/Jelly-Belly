//
//  DishInformation.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 16/09/2022.
//

import SwiftUI

struct DishInformationView: View {
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

struct DishOrderInformation: View {
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

struct DishView: View {
    var dish: Dish
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text(dish.name.uppercased())
                    .bold()
                    .font(.title3)
                Spacer()
            }
            DishInformationView(dish: dish)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct DishOrderView: View {
    var dish: Dish
    @ObservedObject var orderCaretaker: OrderCaretaker
    
    var body: some View {
        
        HStack(spacing: 10) {
            if dish.discountable != nil && dish.discountable == true {
                VStack(alignment: .leading) {
                    Text(dish.name.uppercased())
                        .bold()
                        .font(.title3)
                    Spacer()
                        .frame(height: 5.0)
                    Text(String(format: "£%.2f (with discount)", dish.finalCost))
                }
            } else {
                VStack(alignment: .leading) {
                    Text(dish.name.uppercased())
                        .bold()
                        .font(.title3)
                    Spacer()
                        .frame(height: 5.0)
                    Text(String(format: "£%.2f", dish.cost))
                }
            }
            Spacer()
            Button( action: {
                removeFromOrder(orderCaretaker: orderCaretaker, dish: dish)
            }) {
                Image(systemName: "minus.circle")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
    }
}


struct DishInformation_Previews: PreviewProvider {
    static private var orderCaretaker = OrderCaretaker()
    
    static var previews: some View {
        DishView(dish: testDish)
        DishOrderView(dish: testDish, orderCaretaker: orderCaretaker)
    }
}
