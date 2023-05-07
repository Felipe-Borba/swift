//
//  AddSomeoneView-ViewModel.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import SwiftUI

extension AddSomeoneView {
    @MainActor class ViewModel: ObservableObject {
        @Published var name = ""
        var image: Image? {
            guard let inputImage else { return nil }
            return Image(uiImage: inputImage)
        }
        @Published var inputImage: UIImage?
        @Published var showingImagePicker = false
        
        func saveSomeone() -> Someone? {
            guard let inputImage else { return nil }
            return Someone(id: UUID(), name: name, picture: inputImage.jpegData(compressionQuality: 0.8)!)
        }
    }
}
