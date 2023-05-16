//
//  InteractivityView.swift
//  Flashzilla
//
//  Created by Felipe Silva de Borba on 16/05/23.
//

import SwiftUI

struct InteractivityView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle()) // modifica a hit box, se tirar não pega o hit no espaço
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

struct InteractivityView_Previews: PreviewProvider {
    static var previews: some View {
        InteractivityView()
    }
}
