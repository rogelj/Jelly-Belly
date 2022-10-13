//
//  TSwift.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 13/10/2022.
//

import Foundation
import SwiftUI

struct MenuAPIView: View {

    var downloader: MenuItems

    var body: some View {

        List(downloader.myResult, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.menuname)
                    .font(.headline)
                Text(item.resultDescription)
            }
        }
    }


}

struct MenuAPIView_Previews: PreviewProvider {
    static private var downloader = MenuItems()

    static var previews: some View {
        MenuAPIView(downloader: downloader)
    }
}
