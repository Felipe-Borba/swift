//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Felipe Silva de Borba on 26/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .title()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func title() -> some View {
        modifier(Title())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
