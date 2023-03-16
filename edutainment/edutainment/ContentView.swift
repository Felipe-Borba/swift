//
//  ContentView.swift
//  edutainment
//
//  Created by Felipe Silva de Borba on 16/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var startGame = true;
    @State private var multiplicationTables = 2;
    
    var body: some View {
        NavigationView {
            if startGame {
                setupScreen
                    .navigationTitle("Well Come")
            }
        }
    }
    
    var setupScreen: some View {
        VStack {
            Form {
                Section {
                    Text("Which multiplication table are you up to?")
                    Stepper("\(multiplicationTables)", value: $multiplicationTables, in: 2...12, step: 1)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
