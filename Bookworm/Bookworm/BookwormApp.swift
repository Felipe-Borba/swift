//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Felipe Silva de Borba on 09/04/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
