//
//  StoreDataView.swift
//  BucketList
//
//  Created by Felipe Silva de Borba on 24/04/23.
//

import SwiftUI

// sync automaticaly with iCloud, so if user have a new device all data can be restored
// because all iOS apps are sandboxed this mean this directory is private to the user and our app
struct StoreDataView: View {
    var body: some View {
        Text("Hello World")
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")

                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}

struct StoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDataView()
    }
}
