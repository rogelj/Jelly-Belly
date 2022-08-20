//
//  BackgroundView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

/**
 The Top View of the landing page
 */
struct TopView: View {
    @State private var onboardingIsShowing = false
    
    var body: some View {
        HStack{
            Spacer()
            Button( action: {
                onboardingIsShowing = true
            }) {
                RoundedImageView(systemName: "fork.knife")
            }.sheet(isPresented: $onboardingIsShowing, onDismiss: {}, content: {
                OnboardView(onboardingIsShowing: $onboardingIsShowing)
            })
            .padding()
        }
    }
}

/**
 A  view to with a bacground in the `BackgroundColorAccent` color
 */
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
