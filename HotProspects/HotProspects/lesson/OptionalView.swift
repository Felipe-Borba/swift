//
//  OptionalView.swift
//  HotProspects
//
//  Created by Felipe Silva de Borba on 10/05/23.
//

import SwiftUI

struct OptionalView: View {
    @State private var output = ""

    var body: some View {
        Text(output)
             .task {
                 await fetchReadings()
             }
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        switch result {
            case .success(let str):
                output = str
            case .failure(let error):
                output = "Error: \(error.localizedDescription)"
        }
    }
}

struct OptionalView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalView()
    }
}
