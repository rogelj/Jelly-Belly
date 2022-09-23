//
//  WelcomeView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 16/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State private var customerOrder = Order()
    
    var body: some View {
        ZStack {
            HomeBackgroundView(customerOrder: $customerOrder)
            VStack {
                Spacer()
                    .frame(height: 30.0)
                HStack {
                    // Using the constant declared for a username 
                    BigBoldText(text: greeting(userName: userNameJB))
                        .padding(.leading, 30.0)
                        .padding(.trailing, 30.0)
                }
            .padding(.bottom, 300)
            }
            RoundLogoView(imageSize: Constants.Logo.logoViewSize)
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
        WelcomeView()
            .preferredColorScheme(.dark)
        WelcomeView()
            .previewInterfaceOrientation(.landscapeLeft)
        WelcomeView()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}

