//
//  SideBySideView.swift
//  SnowSeeker
//
//  Created by Felipe Silva de Borba on 28/05/23.
//

import SwiftUI

struct SideBySideView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
            
            Text("Tird")
        }
    }
}

struct SideBySideView_Previews: PreviewProvider {
    static var previews: some View {
        SideBySideView()
    }
}
