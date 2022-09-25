//
//  JBPizzaViewModel.swift
//  Jelly Belly
//
//  Created by Jesus Rogel on 25/09/2022.
//
import SwiftUI

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
