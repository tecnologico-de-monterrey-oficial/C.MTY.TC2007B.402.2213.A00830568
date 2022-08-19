//
//  ContentView.swift
//  App03-Listas
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct ListView: View {
    
    var dogs: [String] = ["Bulldog", "Pastor Alemán", "Labrador Retriever", "Chihuahua", "Pug", "Poodle","Husky Siberiano"]
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(dogs, id: \.self) { dog in
                        NavigationLink {
                            DogView(nomImg: dog)
                        } label: {
                            Text(dog)
                                .padding()
                        }
                    }
                }
                .padding(.top, 25)
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
