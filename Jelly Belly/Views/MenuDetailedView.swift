//
//  MenuDetailedView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 11/09/2022.
//

import SwiftUI
import CoreData

struct MenuDetailedView: View {
    var dish: Dish

    @ObservedObject var orderCaretaker: OrderCaretaker

    @EnvironmentObject var imageLoader: ImageLoader
    
    var body: some View {
        VStack {
            DishCircle(dish: dish)
            DishInformationView(dish: dish)
            Spacer()
                .frame(height: 30.0)
            Button("Add to Order") {
                addToOrder(orderCaretaker: orderCaretaker, dish: dish)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .padding().navigationBarTitle(Text(dish.name), displayMode: .inline)
    }
}

struct MenuCDDetailedView: View {
    var dish: DishEntity

    @State var tags: String = ""

    @ObservedObject var orderCaretaker: OrderCaretaker

    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context

    var body: some View {
        VStack {
//            DishCircle(dishName: dish.name)
            DishInformationCDView(dish: dish)
            Spacer()
                .frame(height: 30.0)

            TextField("Tags", text: $tags)
//            Text("\(dish.tags)")

            Spacer()
            Button(action: {
                let tags = Set(self.tags.split(separator: ",").map {
                    Tag.fetchOrCreateWith(title: String($0), in: self.context)
                })
                DishEntity.createWith(
                    name: self.dish.name,
                    cuisine: self.dish.cuisine,
                    cost: self.dish.cost,
                    special: self.dish.special,
                    discountable: self.dish.discountable,
                    dishDescription: self.dish.dishDescription,
                    tags: tags,
                    using: self.context)
                dismiss()
            }, label: {
                Text("Save")
                    .fontWeight(.bold)
            })
//            Button("Add to Order") {
//                addToOrder(orderCaretaker: orderCaretaker, dish: dish)
//            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roudedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .padding().navigationBarTitle(Text(dish.name), displayMode: .inline)
    }
}

#if DEBUG
struct MenuDetailedView_Previews: PreviewProvider {
//    static private var customerOrder = Binding.constant(Order(loadTestData: true))
    static private var orderCaretaker = OrderCaretaker()
    
    static var previews: some View {
        MenuDetailedView(dish: testDish, orderCaretaker: orderCaretaker)
            .environmentObject(ImageLoader())
    }
}
#endif
