//
//  User.swift
//  Friendface
//
//  Created by Felipe Silva de Borba on 16/04/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Felipe", age: 27, company: "Felipe SA", email: "felipe@email.com", address: "5555, Some where, Over the rainbow, Java Island", about: "Just a programer adicted to cofee", registered: Date.now, tags: ["Dev", "cofee"], friends: [Friend(id: UUID(), name: "Isis")])
}
