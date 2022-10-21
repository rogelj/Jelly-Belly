
import SwiftUI

// Assignment 1 - Splash screen with animation
struct SplashScreen: View {

    @State private var cookieName: String?
    @State private var cookieValue: String?

    static var shouldAnimate = true

    @State var percent = 0.0
    @State var eScale: CGFloat = 1
    @State var eLetterColor = Color.white
    @State var eLetterScale: CGFloat = 1
    @State var lineScale: CGFloat = 1
    @State var textAlpha = 0.0
    @State var textScale: CGFloat = 1
    @State var coverScale: CGFloat = 1
    @State var coverCircleAlpha = 0.0

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        let imageLogo = colorScheme == .dark ? "JellyBellyDark" : "JellyBelly"

        ZStack {
            Image(imageLogo)
                .resizable(resizingMode: .tile)
                .opacity(textAlpha)
                .scaleEffect(textScale)

            Rectangle()
                .fill(Color("Belly"))
                .frame(width: 1, height: 1,
                       alignment: .center)
                .scaleEffect(coverScale)
                .opacity(coverCircleAlpha)

            Text("J     llyBelly")
                .font(.largeTitle)
                .foregroundColor(.white)
                .opacity(textAlpha)
                .offset(x: 43, y: -4)
                .scaleEffect(textScale)

            LetterE(percent: percent)
                .stroke(Color.white, lineWidth: Constants.Animation.eLineWidth)
                .rotationEffect(.degrees(-90))
                .aspectRatio(1, contentMode: .fit)
                .padding(20)
                .onAppear() {
                    self.handleAnimations()
                }
                .scaleEffect(eScale * Constants.Animation.uZoomFactor)
                .frame(width: 45, height: 45,
                       alignment: .center)

            Circle()
                .fill(eLetterColor)
                .scaleEffect(eLetterScale * Constants.Animation.uZoomFactor)
                .frame(width: Constants.Animation.eCircleRadius, height: Constants.Animation.eCircleRadius,
                       alignment: .center)
                .onAppear() {
                    self.eLetterColor = Color("Belly")
                }

            Rectangle()
                .fill(Color("Jelly"))
                .scaleEffect(lineScale, anchor: .bottom)
                .frame(width: Constants.Animation.lineWidth, height: Constants.Animation.lineHeight,
                       alignment: .center)
                .offset(x: 30, y: 0)

            Spacer()
        }
        .background(Color("Jelly"))
        .edgesIgnoringSafeArea(.all)
    }
}

extension SplashScreen {
    var eAnimationDuration: Double { return 0.7 }
    var eAnimationDelay: Double { return  0.2 }
    var eExitAnimationDuration: Double { return 0.3 }
    var finalAnimationDuration: Double { return 0.4 }
    var minAnimationInterval: Double { return 0.1 }
    var fadeAnimationDuration: Double { return 0.4 }

    func handleAnimations() {
        animationP1()
        animationP2()
        animationP3()
        if SplashScreen.shouldAnimate {
            restartAnimation()
        }
    }

    func animationP1() {
        withAnimation(.easeIn(duration: eAnimationDuration)) {
            percent = 1
            eScale = 5
            lineScale = 1
        }

        withAnimation(Animation.easeIn(duration: eAnimationDuration).delay(0.5)) {
            textAlpha = 1.0
        }

        let deadline: DispatchTime = .now() + eAnimationDuration + eAnimationDelay
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            withAnimation(.easeOut(duration: self.eExitAnimationDuration)) {
                self.eScale = 0
                self.lineScale = 0
            }
            withAnimation(.easeOut(duration: self.minAnimationInterval)) {
                self.eLetterScale = 0
            }

            withAnimation(Animation.spring()) {
                self.textScale = Constants.Animation.uZoomFactor
            }
        }
    }

    func animationP2() {
        let deadline: DispatchTime = .now() + eAnimationDuration + eAnimationDelay + minAnimationInterval
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.eLetterColor = Color.white
            self.eLetterScale = 1
            withAnimation(.easeOut(duration: self.fadeAnimationDuration)) {
                self.coverCircleAlpha = 1
                self.coverScale = 1000
            }
        }
    }

    func animationP3() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2*eAnimationDuration) {
            withAnimation(.easeIn(duration: self.finalAnimationDuration)) {
                self.textAlpha = 0
                self.eLetterColor = Color("Jelly")
            }
        }
    }

    func restartAnimation() {
        let deadline: DispatchTime = .now() + 2*eAnimationDuration + finalAnimationDuration
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.percent = 0
            self.textScale = 1
            self.coverCircleAlpha = 0
            self.coverScale = 1
            self.handleAnimations()
        }
    }
}

struct LetterE: Shape {
    var percent: Double

    func path(in rect: CGRect) -> Path {
        let end = -percent * 270
        var p = Path()

        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: 90),
                 endAngle: Angle(degrees: end),
                 clockwise: true)

        return p
    }

    var animatableData: Double {
        get { return percent }
        set { percent = newValue }
    }
}

#if DEBUG
struct SplashScreen_Previews : PreviewProvider {
    static var previews: some View {
        SplashScreen()
        SplashScreen()
            .preferredColorScheme(.dark)
    }
}
#endif
