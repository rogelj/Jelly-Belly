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

    @FetchRequest(entity: DishEntity.entity(), sortDescriptors: []) var menuDishes: FetchedResults<DishEntity>

    var body: some View {
        VStack {

            List {
                ForEach(menuDishes, id: \.self) { md in
                    VStack(alignment: .leading) {
                        Text("\(md.name)")
                            .font(.headline)
                        Text("\(md.dishDescription)")
                        Text("Cuisine: \(md.cuisine)")
                        Text(String(format: "Cost: £%.2f", md.cost))
                    }
                }
            }
        }
    }
}

struct CoreDataView_Previews: PreviewProvider {

    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let newDish = DishEntity(context: context)
        newDish.name = "Pasta Bake"
        newDish.dishDescription = "A delicious pasta bake."
//        MenuAPIView(downloader: downloader)
        return CoreDataView()
    }
}