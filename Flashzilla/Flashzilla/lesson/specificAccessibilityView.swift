//
//  specificAccessibilityView.swift
//  Flashzilla
//
//  Created by Felipe Silva de Borba on 17/05/23.
//

import SwiftUI

struct specificAccessibilityView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct specificAccessibilityView_Previews: PreviewProvider {
    static var previews: some View {
        specificAccessibilityView()
    }
}
