//
//  CreatingContextMenus.swift
//  HotProspects
//
//  Created by Felipe Silva de Borba on 11/05/23.
//

import SwiftUI

struct CreatingContextMenus: View {
    @State private var backgroundColor = Color.red

        var body: some View {
            VStack {
                Text("Hello, World!")
                    .padding()
                    .background(backgroundColor)

                Text("Change Color")
                    .padding()
                    .contextMenu {
                        Button(role: .destructive) {
                            backgroundColor = .red
                        } label: {
                            Label("Red", systemImage: "checkmark.circle.fill")
                        }

                        Button("Green") {
                            backgroundColor = .green
                        }

                        Button("Blue") {
                            backgroundColor = .blue
                        }
                    }
            }
        }
}

struct CreatingContextMenus_Previews: PreviewProvider {
    static var previews: some View {
        CreatingContextMenus()
    }
}
