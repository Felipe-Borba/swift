//
//  AddSomeoneView.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import SwiftUI

struct AddSomeoneView: View {
    @ObservedObject private var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    var onSave: (Someone) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ZStack {
                        Rectangle()
                            .fill(.secondary)
                        
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        viewModel.image?
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height: 200.0)
                    .onTapGesture {
                        viewModel.showingImagePicker = true
                    }
                }
                
                Section {
                    TextField("Name", text: $viewModel.name)
                }
                
                Button("Save") {
                    if let someone = viewModel.saveSomeone() {
                        onSave(someone)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Someone")
            .sheet(isPresented: $viewModel.showingImagePicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
        }
    }
}

struct AddSomeoneView_Previews: PreviewProvider {
    static var previews: some View {
        AddSomeoneView() { someone in }
    }
}
