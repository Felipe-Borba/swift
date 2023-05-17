//
//  BackgroundTaskView.swift
//  Flashzilla
//
//  Created by Felipe Silva de Borba on 17/05/23.
//

import SwiftUI

struct BackgroundTaskView: View {
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct BackgroundTaskView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundTaskView()
    }
}
