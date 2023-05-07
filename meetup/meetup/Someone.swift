//
//  Someone.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import UIKit
import SwiftUI

struct Someone: Identifiable, Codable {
    var id: UUID
    var name: String
    var picture: Data
    
    var image: Image? {
        guard let uiImage = UIImage(data: picture) else { return nil }
        return Image(uiImage: uiImage)
    }
    
    static func example() -> Someone {
        Someone(id: UUID(), name: "Isis", picture: UIImage(named: "isis")!.jpegData(compressionQuality: 0.8)!)
    }
}
