//
//  Activity.swift
//  HabitTracking
//
//  Created by Felipe Silva de Borba on 02/04/23.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Coffee", description: "Drink cofee to code")
}
