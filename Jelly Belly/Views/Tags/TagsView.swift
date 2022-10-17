//
//  TagsView.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 17/10/2022.
//

import SwiftUI

struct TagsView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) private var dismiss

    let tags: [Tag]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        ForEach(tags, id: \.self) { tag in
                            Text("\(tag.title!)")
                        }
                    }
                }
                .navigationBarTitle(Text("Tags"))
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let tag = Tag(context: context)
        tag.title = "Yum"
        return TagsView(tags: [tag])
    }
}

