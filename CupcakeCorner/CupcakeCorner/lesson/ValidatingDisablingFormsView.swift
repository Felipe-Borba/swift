//
//  ValidatingDisablingFormsView.swift
//  CupcakeCorner
//
//  Created by Felipe Silva de Borba on 04/04/23.
//

import SwiftUI

struct ValidatingDisablingFormsView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct ValidatingDisablingFormsView_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingDisablingFormsView()
    }
}
