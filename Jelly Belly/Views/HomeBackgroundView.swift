//
//  BackgroundView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack{
            Spacer()
            RoundedImageView(systemName: "fork.knife")
        }
    }
}

struct LogoView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColorAccent")
                .edgesIgnoringSafeArea(.all)
            RoundLogoView(imageSize: Constants.General.logoViewSize)
        }
    }
}


struct HomeBackgroundView: View {
    var body: some View {
        VStack {
            TopView()
            Spacer()
        }
        .padding()
        .background(LogoView())
    }
}

struct HomeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundView()
        HomeBackgroundView()
            .preferredColorScheme(.dark)
    }
}
