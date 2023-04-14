//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Felipe Silva de Borba on 13/04/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
