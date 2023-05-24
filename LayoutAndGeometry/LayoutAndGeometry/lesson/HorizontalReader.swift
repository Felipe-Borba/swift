//
//  HorizontalReader.swift
//  LayoutAndGeometry
//
//  Created by Felipe Silva de Borba on 24/05/23.
//

import SwiftUI

struct HorizontalReader: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 9, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct HorizontalReader_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalReader()
    }
}
