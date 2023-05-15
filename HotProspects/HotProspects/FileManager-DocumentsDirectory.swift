//
//  FileManager-DocumentsDirectory.swift
//  HotProspects
//
//  Created by Felipe Silva de Borba on 15/05/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
