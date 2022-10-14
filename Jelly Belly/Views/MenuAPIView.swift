//
//  MenuAPIView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 13/10/2022.
//

import Foundation
import SwiftUI
import CoreData

struct MenuAPIView: View {

    @Environment(\.managedObjectContext) var viewContext

//    let menuFetchRequest = DishEntity.basicFetchRequest()
//    var menuDishes: FetchedResults<DishEntity> {
//        menuFetchRequest.wrappedValue
//    }

    @FetchRequest(entity: DishEntity.entity(), sortDescriptors: []) var menuDishes: FetchedResults<DishEntity>


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
