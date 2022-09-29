//
//  JBPizzaViewModel.swift
//  Jelly Belly
//
//  Created by Jesus Rogel on 25/09/2022.
//
import SwiftUI

func buildJBPizza(protein: Proteins, sauce: Sauces, cheese: Cheeses, veggies: [Vegetables], orderCaretaker: OrderCaretaker) {
    
    let builder = JBPizzaBuilder()
    if protein != .none {
        builder.setProtein(protein)
    }
    if sauce != .none {
        builder.setSauce(sauce)
    }
    builder.setCheese(cheese)
    builder.addVegetable(veggies)
    
    let JBPizza = builder.build()

    addToOrder(orderCaretaker: orderCaretaker, dish: JBPizza)
}

struct GridRow: View {
    let item: Vegetables
    
    @Binding var items: [Vegetables]
    
    var body: some View {
        Button(action: {
            if items.contains(item) {
                items.removeAll { $0 == item }
            } else {
                items.append(item)
            }
        }, label: {
            Text(item.rawValue.capitalized)
                .tag(item)
                .foregroundColor(items.contains(item) ? .white : .purple)
        })
        
        .frame(width: 100, height: 60)
        .background(items.contains(item) ? Color.purple : Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
