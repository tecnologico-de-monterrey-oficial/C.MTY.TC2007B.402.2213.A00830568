//
//  ContentView.swift
//  App02-ListaColores
//
//  Created by Edgar Alexandro on 15/08/22.
//

import SwiftUI

struct ListView: View {
    
    var colors: [String] = ["Azul", "Blanco", "Naranja", "Rojo", "Celeste", "Verde","DraculaOrchid"]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("American") {
                        ForEach(Colour.american) { colour in
                            NavigationLink {
                                ColorView(colour: colour)
                            } label: {
                                Text(colour.name)
                                    .padding()
                            }
                        }
                    }
                    Section {
                        ForEach(Colour.spanish) { colour in
                            NavigationLink {
                                ColorView(colour: colour)
                            } label: {
                                HStack {
                                    Text(colour.name)
                                        .padding()
                                    Text(colour.dark ? "Dark" : "Light")
                                }
                            }
                        }
                    } header: {
                        Text("Spanish")
                            .font(.system(.largeTitle))
                    }
                    Section {
                        ForEach(Colour.flatUI) { colour in
                            NavigationLink {
                                ColorView(colour: colour)
                            } label: {
                                Text(colour.name)
                                    .padding()
                            }
                        }
                    } header: {
                        Text("Flat UI")
                            .font(.system(.largeTitle))
                    }

                    
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Lista Colores")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(.white, UIColor(Colour.ElectronBlue.colour))
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
