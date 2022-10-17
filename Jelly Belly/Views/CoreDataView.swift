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

    @Environment(\.managedObjectContext) var contexts

    @ObservedObject var orderCaretaker: OrderCaretaker

    @State var isShowingTagsModal = false

    // Assignment 3 - displaying core data contents in a separate view
    // and sorting by cost and name, as well as filtering only for specials
    @FetchRequest(entity: DishEntity.entity(),
                  sortDescriptors:
                    [NSSortDescriptor(key: "cost", ascending: true),
                     NSSortDescriptor(key: "name", ascending: true)
                    ],
                  predicate: NSPredicate(format: "%K == %@", "special", NSNumber(value: true))
    ) var menuDishes: FetchedResults<DishEntity>


    var myTags: Array<Tag> {
        let tagSet = menuDishes.compactMap( {$0.tags} ).reduce(Set<Tag>(), { (result, t) in
            var result = result
            result.formUnion(t)
            return result
        })
        //        print("\(String(describing: tagSet))")
        return Array(tagSet)
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    BigText(text: "Jelly Belly Specials")
                        .padding()
                    Spacer()
                    Button("Tags") {
                        self.isShowingTagsModal.toggle()
                    }
                    .sheet(isPresented: self.$isShowingTagsModal, content: {
                        TagsView(tags: myTags)
                    })
                    .padding()
                    Spacer()
                        .frame(width: 3.0)
                }
                NavigationView {
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
}

//struct CoreDataView_Previews: PreviewProvider {
//    static private var downloader = MenuItems()
//    static private var orderCaretaker = OrderCaretaker()
//
//    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
//        let newDish = DishEntity(context: context)
//        newDish.name = "Pasta Bake"
//        newDish.dishDescription = "A delicious pasta bake."
//        return CoreDataView(orderCaretaker: orderCaretaker)
//    }
//}
