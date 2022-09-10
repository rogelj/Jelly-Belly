//
//  MenuListView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import SwiftUI

struct MenuUIListView: View {
    @Binding var menuUIKitIsShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    menuUIKitIsShowing.toggle()
                }) {
                    Text("Done")
                        .bold()
                        .foregroundColor(Color("Belly"))
                }
                .padding(.all)
            }
            Spacer()
            Text("Jelly Belly Menu")
                .foregroundColor(Color("Jelly"))
                .font(.title)
            VStack {
                UIList(rows: dishes)
            }
        }
    }
}


struct MenuUIListView_Previews: PreviewProvider {
    static private var menuUIKitIsShowing = Binding.constant(false)
    
    static var previews: some View {
        MenuUIListView(menuUIKitIsShowing: menuUIKitIsShowing)
    }
}
