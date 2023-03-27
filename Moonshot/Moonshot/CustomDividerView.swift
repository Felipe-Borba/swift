//
//  CustomDividerView.swift
//  Moonshot
//
//  Created by Felipe Silva de Borba on 27/03/23.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDividerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDividerView()
    }
}
