//
//  TextViews.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

/**
 A text view to create big bold text as used in the welcome page.
 */
struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .kerning(-1.0)
            .foregroundColor(Color("Jelly"))
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

/**
 A text view to create big big text as used in the onboarding page.
 */
struct BigText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("Jelly"))
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
    }
}

struct DishItemText: View {
    let text: String
    
    var body: some View {
        Text("\(text)")
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/**
 A text view to create text used in the body of the app.
 */
struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .multilineTextAlignment(.leading)
    }
}

func greet(name: String) -> NSAttributedString {
    let attributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
      let message = NSAttributedString(string: "Hello " + name, attributes: attributes)
      return message
}

struct TextViews: View {
    let hey = greet(name: "Hey there")
    var body: some View {
        VStack(spacing: 10) {
            BigBoldText(text: "Welcome\n John Appleseed")
            Text("\(hey)")
            BigText(text: "Jelly Belly")
            BodyText(text: "This is an example of the features in the app")
            DishItemText(text: "Pasta")
        }
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextViews()
        TextViews()
            .previewInterfaceOrientation(.landscapeLeft)
        TextViews()
            .preferredColorScheme(.dark)
    }
}

