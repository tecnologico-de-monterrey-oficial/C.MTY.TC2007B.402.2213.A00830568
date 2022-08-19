//
//  ContentView.swift
//  App03-Listas
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct ListView: View {
    
    var dogsS: [String] = ["Chihuahua", "Pomerania", "Beagle", "Pug", "Poodle", "Corgi galés de Pembroke"]
    var dogsM: [String] = ["Appenzell", "Border Collie", "Labrador Retriever", "Cocker", "Bulldog"]
    var dogsL: [String] = ["San bernardo", "Gran danés", "Terranova", "Lobero irlandés", "Rottweiler"]
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section {
                        ForEach(dogsS, id: \.self) { dogS in
                            NavigationLink {
                                DogView(nomImg: dogS)
                            } label: {
                                Text(dogS)
                                    .padding()
                            }
                        }
                    } header: {
                        Text("Razas pequeñas")
                            .font(.custom("Rationale-Regular", size: 40))
                            .padding(.vertical, 10)
                    }
                    Section {
                        ForEach(dogsM, id: \.self) { dogM in
                            NavigationLink {
                                DogView(nomImg: dogM)
                            } label: {
                                Text(dogM)
                                    .padding()
                            }
                        }
                    } header: {
                        Text("Razas medianas")
                            .font(.custom("Rationale-Regular", size: 40))
                            .padding(.vertical, 10)
                    }
                    Section {
                        ForEach(dogsL, id: \.self) { dogL in
                            NavigationLink {
                                DogView(nomImg: dogL)
                            } label: {
                                Text(dogL)
                                    .padding()
                            }
                        }
                    } header: {
                        Text("Razas grandes")
                            .font(.custom("Rationale-Regular", size: 40))
                            .padding(.vertical, 10)
                    }
                }
                
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Razas de perros")
            //.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
