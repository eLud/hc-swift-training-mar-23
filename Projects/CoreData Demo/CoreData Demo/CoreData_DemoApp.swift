//
//  CoreData_DemoApp.swift
//  CoreData Demo
//
//  Created by Ludovic Ollagnier on 10/03/2023.
//

import SwiftUI

@main
struct CoreData_DemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
