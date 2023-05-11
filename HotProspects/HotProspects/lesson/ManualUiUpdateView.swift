//
//  ManualUiUpdateView.swift
//  HotProspects
//
//  Created by Felipe Silva de Borba on 11/05/23.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManualUiUpdateView: View {
    @StateObject var updater = DelayedUpdater()

    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ManualUiUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        ManualUiUpdateView()
    }
}
