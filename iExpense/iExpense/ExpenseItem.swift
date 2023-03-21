//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Felipe Silva de Borba on 21/03/23.
//

import Foundation
struct ExpenseItem: Identifiable, Codable {
    var id =  UUID()
    let name: String
    let type: String
    let amount: Double
}
