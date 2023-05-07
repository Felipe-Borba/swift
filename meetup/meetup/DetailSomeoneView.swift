//
//  DetailSomeoneView.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 06/05/23.
//

import SwiftUI

struct DetailSomeoneView: View {
    let someone: Someone
    
    var body: some View {
        NavigationView {
            VStack {
                someone.image?
                    .resizable()
                    .scaledToFit()
            }
            .navigationTitle(someone.name)
        }
    }
}

struct DetailSomeoneView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSomeoneView(someone: Someone.example())
    }
}
