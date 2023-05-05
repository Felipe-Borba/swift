//
//  AddSomeoneView-ViewModel.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import Foundation

extension AddSomeoneView {
    @MainActor class ViewModel: ObservableObject {
        @Published var name: String
    }
}
