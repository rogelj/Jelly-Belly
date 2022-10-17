//
//  MenuAPIView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 13/10/2022.
//

import Foundation
import SwiftUI
import CoreData

struct CoreDataView: View {

    @Environment(\.managedObjectContext) var context

    @ObservedObject var orderCaretaker: OrderCaretaker

    // Assignment 3 - displaying core data contents in a separate view
    // and sorting by cost and name, as well as filtering only for specials
    @FetchRequest(entity: DishEntity.entity(),
                  sortDescriptors:
                    [NSSortDescriptor(key: "cost", ascending: true),
                     NSSortDescriptor(key: "name", ascending: true)
                    ],
                  predicate: NSPredicate(format: "%K == %@", "special", NSNumber(value: true))
    ) var menuDishes: FetchedResults<DishEntity>

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    BigText(text: "Jelly Belly Menu")
                        .padding()
                    Spacer()
                    RoundLogoView(imageSize: Constants.Logo.logoViewSizeTiny )
                        .padding()

                }
                
                List {
                    ForEach(menuDishes, id: \.self) { md in
                        NavigationLink(destination: MenuCDDetailedView(dish: md, orderCaretaker: orderCaretaker)) {
                            MenuCDRowView(dish: md)
                                .padding(.leading)
                        }
                    }
                }
            }
        }

    }
}

struct CoreDataView_Previews: PreviewProvider {
    static private var downloader = MenuItems()
    static private var orderCaretaker = OrderCaretaker()

    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let newDish = DishEntity(context: context)
        newDish.name = "Pasta Bake"
        newDish.dishDescription = "A delicious pasta bake."
        return CoreDataView(orderCaretaker: orderCaretaker)
    }
}
