//
//  OnboardView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

/**
 Header for the onboarding page including:
 - App name
 - App logo
 */
struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
            VStack(spacing: 20.0) {
                Spacer()
                    .frame(height: 30)
                BigText(text: "Jelly Belly")
                RoundLogoView(imageSize: Constants.Logo.logoViewSizeSmall)
            }
        } else {
            Spacer()
                .frame(height: 0.5)
            HStack {
                BigText(text: "Jelly Belly")
                    .padding(.leading)
                Spacer()
                RoundLogoView(imageSize: Constants.Logo.logoViewSizeSmall)
                    .padding(.trailing)
            }
        }
    }
}


/**
 A  view to create rows for the list of features, enumerated with a rounded view
 */
struct RowView: View {
    let index: Int
    let text: String
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
                .padding(.leading)
            Spacer()
            BodyText(text: text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing)
        }
    }
}

/**
 Main onboard view
 */
struct OnboardView: View {
    @Binding var onboardingIsShowing: Bool
    
    let featuresToBuild = ["The app shows a menu as a list",
                       "Menu list is fetched from an API and saved in the app",
                       "Users can choose menu items and add them to their order",
                       "Upon placing an order, users can select or add a tip",
                       "Upon checkout, total amount will be calculated",
                       "Users can write a review of the menu item and add a photo of the dish"]
    
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView()
            Text("Features to be build over time")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(featuresToBuild.indices, id: \.self) {
                        i in
                        RowView(index: i+1, text: featuresToBuild[i])
                    }
                }
            }
            Button(action: {
                onboardingIsShowing = false
            }) {
                    Text("OK")
                        .bold()
                       .font(.title3)
                }   .buttonStyle(WideBellyButton())
            Spacer()
                .frame(height: 0.5)
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static private var onboardingIsShowing = Binding.constant(false)
    static var previews: some View {
        OnboardView(onboardingIsShowing: onboardingIsShowing)
        OnboardView(onboardingIsShowing: onboardingIsShowing)
            .preferredColorScheme(.dark)
        OnboardView(onboardingIsShowing: onboardingIsShowing)
            .previewInterfaceOrientation(.landscapeLeft)
        OnboardView(onboardingIsShowing: onboardingIsShowing)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
