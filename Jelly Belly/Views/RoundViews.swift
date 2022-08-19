//
//  RoundViews.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("RingsText"))
            .frame(width: 56.0, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("RingsColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageView: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.largeTitle)
            .foregroundColor(Color("RingsText"))
            .frame(width: 56.0, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("RingsColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundLogoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var imageSize: CGFloat
    var imageLogo: String = "JellyBelly"
    
    var body: some View {
//        Text("here")
        
        let imageLogo = colorScheme == .dark ? "JellyBellyDark" : "JellyBelly"
        
        Image(imageLogo)
            .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize, height: imageSize, alignment: .center)
                .clipShape(Circle())
    }
}

struct RoundViews: View {
    var body: some View {
        VStack(spacing: 10.0) {
            RoundedTextView(text: "1")
            RoundedImageView(systemName: "fork.knife")
            RoundLogoView(imageSize: Constants.General.logoViewSize)
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
