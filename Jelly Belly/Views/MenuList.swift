//
//  MenuList.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import SwiftUI

struct TestUIList: View {
    var body: some View {
        UIList(rows: generateRows())
    }
    
    func generateRows() -> [String] {
        (0..<100).reduce([]) { $0 + ["Row \($1)"] }
    }
}


struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemTableRepresentable()
//        TestUIList()
    }
}
