//
//  ContentView-ViewModel.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 06/05/23.
//

import Foundation

extension ContentView {
    @MainActor class Viewmodel: ObservableObject {
        @Published private(set) var somePeople: [Someone]
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SomePeople")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                somePeople = try JSONDecoder().decode([Someone].self, from: data)
            } catch {
                somePeople = []
            }
        }
        
        func append(someone: Someone?) {
            guard let someone else { return }
            somePeople.append(someone)
            save()
        }
        
        private func save() {
            do {
                let data = try JSONEncoder().encode(somePeople)
                try data.write(to: savePath, options: [.atomic])
            } catch {
                print("Unable to save data.")
            }
        }
    }
}
