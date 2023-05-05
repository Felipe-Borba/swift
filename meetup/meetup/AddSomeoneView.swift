//
//  AddSomeoneView.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import SwiftUI

struct AddSomeoneView: View {
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct AddSomeoneView_Previews: PreviewProvider {
    static var previews: some View {
        AddSomeoneView()
    }
}
