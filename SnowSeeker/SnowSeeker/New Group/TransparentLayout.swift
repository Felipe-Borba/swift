//
//  TransparentLayout.swift
//  SnowSeeker
//
//  Created by Felipe Silva de Borba on 28/05/23.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct TransparentLayout: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        if sizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
}

struct TransparentLayout_Previews: PreviewProvider {
    static var previews: some View {
        TransparentLayout()
    }
}
