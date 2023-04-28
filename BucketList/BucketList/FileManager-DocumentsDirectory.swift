//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Felipe Silva de Borba on 28/04/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
