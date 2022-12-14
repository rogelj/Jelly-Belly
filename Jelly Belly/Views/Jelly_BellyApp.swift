//
//  Jelly_BellyApp.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

import SwiftUI

@main
struct Jelly_BellyApp: App {

    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(Network())
                .environmentObject(ImageLoader())
        }
    }
}
