//
//  MenuUITableView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 12/09/2022.
//

import SwiftUI

struct MenuUITableView: View {
    @Binding var menuStoryIsShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    menuStoryIsShowing.toggle()
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
                UITableShow()
            }
        }
    }
}

struct MenuUITableView_Previews: PreviewProvider {
    static private var menuStoryIsShowing = Binding.constant(false)
    
    static var previews: some View {
        MenuUITableView(menuStoryIsShowing: menuStoryIsShowing)
    }
}
