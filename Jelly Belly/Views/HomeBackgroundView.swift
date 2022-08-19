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
                .padding()
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColorAccent")
                .edgesIgnoringSafeArea(.all)
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
        .background(BackgroundView())
    }
}

struct HomeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundView()
        HomeBackgroundView()
            .preferredColorScheme(.dark)
    }
}
