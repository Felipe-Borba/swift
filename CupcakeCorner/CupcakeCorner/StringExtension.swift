//
//  StringExtension.swift
//  CupcakeCorner
//
//  Created by Felipe Silva de Borba on 08/04/23.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
