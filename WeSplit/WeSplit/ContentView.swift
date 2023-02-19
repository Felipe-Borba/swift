//
//  ContentView.swift
//  WeSplit
//
//  Created by Felipe Silva de Borba on 19/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter your name", text: $name)
                Text("Hello, \(name)")
                Button("count: \(counter)") {
                    counter += 1
                }
            }.navigationTitle("title")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
