//
//  AddSomeoneView-ViewModel.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import CoreLocation
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
        
        var location = CLLocation()
        var locationFetcher = LocationFetcher()
        
        func startLocation() {
            locationFetcher.start()
            locationFetcher.locationManager(locationFetcher.manager, didUpdateLocations: [location])
        }
        
        func saveSomeone() -> Someone? {
            guard let inputImage else { return nil }
            guard let coordinates = locationFetcher.lastKnownLocation else { return nil }
            
            return Someone(id: UUID(), name: name, picture: inputImage.jpegData(compressionQuality: 0.8)!, latitude: coordinates.latitude, longitude: coordinates.longitude )
        }
    }
}
