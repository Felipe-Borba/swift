//
//  FileManager-DocumentsDirectory.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
