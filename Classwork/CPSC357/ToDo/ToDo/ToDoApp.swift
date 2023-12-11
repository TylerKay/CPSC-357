//
//  ToDoApp.swift
//  ToDo
//
//  Created by Tyler Kay on 10/19/23.
//

import SwiftUI

@main
struct ToDoApp: App {
    var body: some Scene {
        let persistentContainer = PersistentController.shared
        WindowGroup {
            ContentView().environment(\.managedObjectContext,
                                       persistentContainer.container.viewContext)
        }
    }
}
