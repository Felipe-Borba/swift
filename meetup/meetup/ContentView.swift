//
//  ContentView.swift
//  Meetup
//
//  Created by Felipe Silva de Borba on 05/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewmodel = Viewmodel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewmodel.somePeople) { someone in
                    NavigationLink {
                        DetailSomeoneView(someone: someone)
                    } label: {
                        HStack {
                            //Image(uiImage: UIImage(data: someone.picture)!)
                            someone.image?
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            Text(someone.name)
                                .font(.headline)
                            
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Meetup")
            .toolbar {
                NavigationLink {
                    AddSomeoneView { someone in
                        viewmodel.append(someone: someone)
                    }
                } label: {
                    Label("Add someone", systemImage: "plus")
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
