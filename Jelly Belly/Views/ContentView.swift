//
//  ContentView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    let userName = "John Appleseed"
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HomeBackgroundView()
            VStack(spacing: 50) {
                HStack {
                    if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                        BigBoldText(text: "Welcome\n\(userName)")
                    } else {
                        BigBoldText(text: "Welcome \(userName)")
                            .padding(.leading, 30.0)
                            .padding(.trailing, 30.0)
                    }
                }
            .padding(.bottom, 300)
            }
            RoundLogoView(imageSize: Constants.General.logoViewSize)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
