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
    var body: some View {
        VStack(spacing: 20.0) {
            BigText(text: "Jelly Belly")
            RoundLogoView(imageSize: Constants.General.logoViewSizeSmall)
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

struct OnboardView: View {
    let featuresToBuild = ["The app shows a menu as a list",
                       "Menu list is fetched from an API and saved in the app",
                       "Users can choose menu items and add them to their order",
                       "Upon placing an order, users can select or add a tip",
                       "Upon checkout, total amount will be calculated",
                       "Users can write a review of the menu item and add a photo of the dish"]
    
    var body: some View {
        VStack(spacing: 30.0) {
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
            Button(action: { }) {
                    Text("OK")
                        .bold()
                       .font(.title3)
                }   .buttonStyle(WideBellyButton())
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
        OnboardView()
            .preferredColorScheme(.dark)
        OnboardView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
