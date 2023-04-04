//
//  CodablePublishedView.swift
//  CupcakeCorner
//
//  Created by Felipe Silva de Borba on 04/04/23.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Paul Hudson"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct CodablePublishedView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct CodablePublishedView_Previews: PreviewProvider {
    static var previews: some View {
        CodablePublishedView()
    }
}
