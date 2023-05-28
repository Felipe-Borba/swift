//
//  OptionalAlertSheet.swift
//  SnowSeeker
//
//  Created by Felipe Silva de Borba on 28/05/23.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct OptionalAlertSheet: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingAlert = false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
                isShowingAlert = true
            }
            .alert("Welcome", isPresented: $isShowingAlert, presenting: selectedUser) { user in
                Button(user.id) { }
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
            }
    }
}

struct OptionalAlertSheet_Previews: PreviewProvider {
    static var previews: some View {
        OptionalAlertSheet()
    }
}
