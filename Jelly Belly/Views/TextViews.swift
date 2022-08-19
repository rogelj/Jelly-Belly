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

struct TextViews: View {
    var body: some View {
        VStack {
            BigBoldText(text: "Welcome\n John Appleseed")
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

