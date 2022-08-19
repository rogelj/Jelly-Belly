//
//  TextViews.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .foregroundColor(Color("Jelly"))
            .font(.largeTitle)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
    }
}

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

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .multilineTextAlignment(.leading)
    }
}

struct TextViews: View {
    var body: some View {
        VStack(spacing: 10) {
            BigBoldText(text: "Welcome\n John Appleseed")
            BigText(text: "Jelly Belly")
            BodyText(text: "This is an example of the features in the app")
        }
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextViews()
        TextViews()
            .preferredColorScheme(.dark)
    }
}

