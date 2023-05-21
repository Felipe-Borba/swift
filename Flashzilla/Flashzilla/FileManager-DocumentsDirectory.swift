//
//  FileManager-DocumentsDirectory.swift
//  Flashzilla
//
//  Created by Felipe Silva de Borba on 21/05/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
