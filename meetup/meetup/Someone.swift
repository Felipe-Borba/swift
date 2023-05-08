//
//  Someone.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import MapKit
import SwiftUI

struct Someone: Identifiable, Codable {
    var id: UUID
    var name: String
    var picture: Data
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    var image: Image? {
        guard let uiImage = UIImage(data: picture) else { return nil }
        return Image(uiImage: uiImage)
    }
    
    static func example() -> Someone {
        Someone(id: UUID(), name: "Isis", picture: UIImage(named: "isis")!.jpegData(compressionQuality: 0.8)!, latitude: 51.501, longitude: -0.141)
    }
}
