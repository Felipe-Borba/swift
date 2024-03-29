//
//  Card.swift
//  Flashzilla
//
//  Created by Felipe Silva de Borba on 18/05/23.
//

import Foundation

struct Card: Codable, Identifiable, Hashable {
    var id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played Din Djarin in The Mandalorian?", answer: "Pedro Pascal")
}
