//
//  WelcomeView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 16/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State private var customerOrder = Order()

    @State private var big = false
    @State private var dim = false
    @State private var animate: Bool = false
    
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
                .scaleEffect(big ? 1.8 : 1.0)
                .opacity(dim ? 0.5 : 1.0)
                .onTapGesture {
                    self.big.toggle()

                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.dim.toggle()
                    }
                }
            ArcChomp(offsetAmount: animate ? 20 : 0)
                .stroke(lineWidth: 5)
                .frame(width: 173, height: 173)
                .onAppear {
                    withAnimation(Animation.easeInOut.repeatForever()) {
                        animate.toggle()
                    }
                }
        }
    }
}


struct ArcChomp: Shape {
    var offsetAmount: Double
    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {

        Path { path in
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offsetAmount),
                endAngle: Angle(degrees: 360 - offsetAmount),
                clockwise: false)
        }
    }
}


#if DEBUG
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
#endif

