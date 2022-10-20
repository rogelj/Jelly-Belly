//
//  DishInformation.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 16/09/2022.
//

import SwiftUI

struct DishInformationCDView: View {
    var dish: DishEntity

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
                    DishItemText(text: "Cost:")
                        .bold()
                    DishItemText(text: "£\(dish.cost)")
                }
            }
            Spacer()
                .frame(height: 5.0)
            VStack {
                DishItemText(text: "Description:")
                    .bold()
                DishItemText(text: "\(dish.dishDescription)")
            }
        }
    }
}


struct DishViewCD: View {
    var dish: DishEntity

    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text(dish.name.uppercased())
                    .bold()
                    .font(.title3)
                Spacer()
            }
            DishInformationCDView(dish: dish)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

//struct DishInformationCD_Previews: PreviewProvider {
//    static private var orderCaretaker = OrderCaretaker()
//
//    static var previews: some View {
//        DishViewCD(dish: testDish)
//    }
//}
