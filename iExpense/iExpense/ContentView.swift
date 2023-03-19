//
//  ContentView.swift
//  iExpense
//
//  Created by Felipe Silva de Borba on 19/03/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "bilbo"
    @Published var lastName = "baggings"
    
}
struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct ContentView: View {
    @StateObject var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("First name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
        }
        .padding()
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "test")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
