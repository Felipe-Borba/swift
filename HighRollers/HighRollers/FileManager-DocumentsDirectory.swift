//
//  FileManager-DocumentsDirectory.swift
//  HighRollers
//
//  Created by Felipe Silva de Borba on 26/05/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
