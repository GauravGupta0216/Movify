//
//  MovifyApp.swift
//  Movify
//
//  Created by Gaurav Kumar on 29/04/25.
//

import SwiftUI

@main
struct MovifyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
