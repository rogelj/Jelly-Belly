//
//  ContentView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            HomeBackgroundView()
            VStack(spacing: 50) {
                BigBoldText(text: "Welcome\n John Appleseed")
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
