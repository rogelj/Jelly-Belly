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
    
struct RoundViews: View {
    var body: some View {
        VStack(spacing: 10.0) {
            RoundedTextView(text: "1")
            RoundedImageView(systemName: "fork.knife")
            RoundLogoView(imageSize: Constants.Logo.logoViewSize)
            JellyBellyButton(message: "OK")
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
