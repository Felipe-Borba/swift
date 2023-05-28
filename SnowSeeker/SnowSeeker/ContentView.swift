//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Felipe Silva de Borba on 28/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    var body: some View {
        TransparentLayout()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
