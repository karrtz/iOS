//
//  karrtzApp.swift
//  karrtz
//
//  Created by Alex Jenke on 19.06.22.
//

import SwiftUI

@main
struct karrtzApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
