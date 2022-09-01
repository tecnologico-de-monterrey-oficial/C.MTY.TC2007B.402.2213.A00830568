//
//  App06_Todos_CoreDataApp.swift
//  App06-Todos-CoreData
//
//  Created by Edgar Alexandro on 01/09/22.
//

import SwiftUI

@main
struct App06_Todos_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
