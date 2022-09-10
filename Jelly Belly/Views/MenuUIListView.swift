//
//  MenuListView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import SwiftUI

struct MenuUIListView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    //                orderIsShowing.toggle()
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
    static var previews: some View {
        MenuUIListView()
    }
}
