//
//  RoundViews.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

/**
 A round view to show one or two characters inside a circle
 */
struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(Color("RingsText"))
            .frame(width: 45.0, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("RingsColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

/**
 A round view to show an image  inside a circle. Best used for suitable SF Symbols
 */
struct RoundedImageView: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title2)
            .foregroundColor(Color("RingsText"))
            .frame(width: 45.0, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("RingsColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

/**
 A  view to embed an image such as the app logo
 */
struct RoundLogoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var imageSize: CGFloat
    var imageLogo: String = "JellyBelly"
    
    var body: some View {
        let imageLogo = colorScheme == .dark ? "JellyBellyDark" : "JellyBelly"
        
        Image(imageLogo)
            .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize, height: imageSize, alignment: .center)
                .clipShape(Circle())
    }
}

/**
 An example on how  to create a custom button
 */
struct JellyBellyButton: View {
    var message: String
    
    var body: some View {

        Button(action: { }) {
                Text(message)
                    .bold()
                   .font(.title3)
            }   .buttonStyle(WideBellyButton())
    }
}

/**
Defining the style of a custom button
 */
struct WideBellyButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: 175, maxHeight: 10)
            .foregroundColor(.white)
            .padding()
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: Constants.General.roudedRectCornerRadius)
                        .fill(Color("Belly"))
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
                    .cornerRadius(Constants.General.roudedRectCornerRadius)
        )
    }
}

struct DishView: View {
    var dish: Dish
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                if dish.special != nil && dish.special == true {
                    VStack(alignment: .leading){
                        Text(dish.name.uppercased())
                            .bold()
                            .font(.title3)
                        Text("Special")
                            .foregroundColor(Color("Jelly"))
                            .font(.headline)
                    }
                    Spacer()
                } else {
                    Text(dish.name.uppercased())
                        .bold()
                        .font(.title3)
                    Spacer()
                }
                Text(dish.mealType.1)
                    .font(.title)
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
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct MenuRowView: View {
    var dish: Dish
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                if dish.special != nil && dish.special == true {
                    VStack(alignment: .leading){
                        Text(dish.name.uppercased())
                            .bold()
                            .font(.title3)
                        Text("Special")
                            .foregroundColor(Color("Jelly"))
                            .font(.headline)
                    }
                    Spacer()
                } else {
                    Text(dish.name.uppercased())
                        .bold()
                        .font(.title3)
                    Spacer()
                }
                Text(dish.mealType.1)
                    .font(.title)
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
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}
    
struct RoundViews: View {
    var body: some View {
        VStack(spacing: 10.0) {
            RoundedTextView(text: "1")
            RoundedImageView(systemName: "fork.knife")
            RoundLogoView(imageSize: Constants.Logo.logoViewSize)
            JellyBellyButton(message: "OK")
            DishView(dish: testDish)
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        RoundViews()
        RoundViews()
            .preferredColorScheme(.dark)
        RoundViews()
            .previewInterfaceOrientation(.landscapeLeft)
        MenuRowView(dish: testDish)
    }
}
