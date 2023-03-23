//
//  Expenses.swift
//  iExpense
//
//  Created by Felipe Silva de Borba on 21/03/23.
//

import Foundation
class Expenses: ObservableObject {
    private let personalKey = "Personal"
    private let businessKey = "Business"
    
    @Published var personal = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personal) {
                UserDefaults.standard.set(encoded, forKey: personalKey)
            }
        }
    }
    
    @Published var business = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(business) {
                UserDefaults.standard.set(encoded, forKey: businessKey)
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: personalKey) {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                personal = decodedItems
            } else {
                personal = []
            }
        } else {
            personal = []
        }
        
        if let savedItems = UserDefaults.standard.data(forKey: businessKey) {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                business = decodedItems
            } else {
                business = []
            }
        } else {
            business = []
        }
    }
}
