//
//  DetailSomeoneView.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 06/05/23.
//

import MapKit
import SwiftUI

struct DetailSomeoneView: View {
    let someone: Someone
    @State private var mapRegion: MKCoordinateRegion
    
    var body: some View {
        NavigationView {
            VStack {
                someone.image?
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Map(coordinateRegion: $mapRegion, annotationItems: [someone]) { someone in
                    MapMarker(coordinate: someone.coordinate)
                }
                
                Spacer()
            }
            .navigationTitle(someone.name)
            .padding()
        }
    }
    
    init(someone: Someone) {
        self.someone = someone
        self._mapRegion = State(initialValue: MKCoordinateRegion(center: someone.coordinate, span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25)))
    }
}

struct DetailSomeoneView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSomeoneView(someone: Someone.example())
    }
}
