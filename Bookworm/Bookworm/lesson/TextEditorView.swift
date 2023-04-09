//
//  TextEditorView.swift
//  Bookworm
//
//  Created by Felipe Silva de Borba on 09/04/23.
//

import SwiftUI

struct TextEditorView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
