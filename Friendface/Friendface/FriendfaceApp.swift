//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Felipe Silva de Borba on 16/04/23.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
