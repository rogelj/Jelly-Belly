//
//  WelcomeView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 16/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State private var customerOrder = Order()
    
    let userName = "John Appleseed"
    
    var body: some View {
        ZStack {
            HomeBackgroundView(customerOrder: $customerOrder)
            VStack {
                Spacer()
                    .frame(height: 30.0)
                HStack {
                    BigBoldText(text: greeting(userName: userName))
                        .padding(.leading, 30.0)
                        .padding(.trailing, 30.0)
                }
            .padding(.bottom, 300)
            }
            RoundLogoView(imageSize: Constants.Logo.logoViewSize)
        }
    }
}

/**
 Greeting generates a welcoming message for the user name provided.
 It takes into account the orientation of the device.
 */
func greeting(userName: String) -> String {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    if verticalSizeClass == .regular && horizontalSizeClass == .compact {
        return "Welcome\n\(userName)"
    } else {
        return "Welcome \(userName)"
 
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

