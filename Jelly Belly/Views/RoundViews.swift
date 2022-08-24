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
 A  view to create a custom button
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
                Text(dish.name.uppercased())
                    .bold()
                    .font(.title3)
                Spacer()
                Text("🍴")
                    .font(.title3)
            }
            HStack {
                VStack {
                    DishItemText(text: "Ingredients:")
                        .bold()
                    ForEach(dish.ingredients.indices, id: \.self) {
                        i in DishItemText(text: "\(dish.ingredients[i].0)")
                    }
                }
                VStack{
                    DishItemText(text: "Cuisine:")
                        .bold()
                    DishItemText(text: dish.cuisine)
                    Spacer()
                        .frame(height: 10.0)
                    DishItemText(text: "Meal:")
                        .bold()
                    DishItemText(text: dish.mealtype)
                }
            }
            Spacer()
                .frame(height: 5.0)
            VStack {
                if dish.special != nil && dish.special == true {
                    DishItemText(text: "Special Dish")
                        .bold()
                    Spacer()
                        .frame(height: 5.0)
                }
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
            DishItemText(text: "Cost:")
                .bold()
            DishItemText(text: "£\(dish.cost)")
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
    }
}
    
struct RoundViews: View {
    let fusilliArrabiata = Dish(name: "Fusilli Arrabiata",
                                ingredients: [(ingredient: "Fusilli", portion: 2.0),
                                              ("Parmesan", 1.0),
                                              ("Pasta Sauce", 1.0)],
                                cuisine: DishParts.cuisine[0],
                                mealtype: DishParts.mealType[1],
                                cost: 15.0,
                                special: true,
                                dietary: DishParts.diet[0])
    
    var body: some View {
        VStack(spacing: 10.0) {
            RoundedTextView(text: "1")
            RoundedImageView(systemName: "fork.knife")
            RoundLogoView(imageSize: Constants.Logo.logoViewSize)
            JellyBellyButton(message: "OK")
            DishView(dish: fusilliArrabiata)
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        RoundViews()
        RoundViews()
            .preferredColorScheme(.dark)
    }
}
