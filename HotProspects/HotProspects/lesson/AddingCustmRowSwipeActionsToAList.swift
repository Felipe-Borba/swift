//
//  AddingCustmRowSwipeActionsToAList.swift
//  HotProspects
//
//  Created by Felipe Silva de Borba on 11/05/23.
//

import SwiftUI

struct AddingCustmRowSwipeActionsToAList: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Hi")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct AddingCustmRowSwipeActionsToAList_Previews: PreviewProvider {
    static var previews: some View {
        AddingCustmRowSwipeActionsToAList()
    }
}
