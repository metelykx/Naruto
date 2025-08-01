//
//  NarutoApp.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 17.07.2025.
//

import SwiftUI

@main
struct NarutoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
