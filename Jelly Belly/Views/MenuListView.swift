//
//  MenuListView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 09/09/2022.
//

import SwiftUI

struct MenuListView: View {
    var body: some View {
        UIList(rows: dishes)
    }

}


struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
