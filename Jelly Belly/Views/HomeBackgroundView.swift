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
    @State private var menuExamplesIsShowing = false
    @Binding var customerOrder: Order
    
    var body: some View {
        HStack{
            Button( action: {
                onboardingIsShowing = true
            }) {
                RoundedImageView(systemName: "info")
            }.sheet(isPresented: $onboardingIsShowing, onDismiss: {}, content: {
                OnboardView(onboardingIsShowing: $onboardingIsShowing)
            })
            .padding()
            Spacer()
            Button( action: {
                menuExamplesIsShowing = true
            }) {
                RoundedImageView(systemName: "fork.knife")
            }
            .fullScreenCover(isPresented: $menuExamplesIsShowing, onDismiss: {}, content: {
                MenuExamples(menuExamplesIsShowing: $menuExamplesIsShowing, customerOrder: $customerOrder)
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
    @Binding var customerOrder: Order
    
    var body: some View {
        VStack {
            TopView(customerOrder: $customerOrder)
            Spacer()
        }
        .padding()
        .background(BackgroundView())
    }
}

struct HomeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundView(customerOrder: .constant(Order()))
        HomeBackgroundView(customerOrder: .constant(Order()))
            .preferredColorScheme(.dark)
    }
}
