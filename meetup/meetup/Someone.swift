//
//  Someone.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import UIKit
import Foundation

struct Someone: Identifiable, Codable {
    var id: UUID
    var name: String
    var picture: Data
    
    static func example() -> Someone {
        Someone(id: UUID(), name: "Isis", picture: )
    }
}
