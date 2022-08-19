//
//  DogView.swift
//  App03-Listas
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct DogView: View {
    
    //@Binding var nomImg: String
    @State var nomImg: String
    
    var body: some View {
        VStack{
            Image(nomImg)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(nomImg)
        }
    }
}

struct DogView_Previews: PreviewProvider {
    
    @State static var nomImg: String = "Perro"
    
    static var previews: some View {
        DogView(nomImg: nomImg)
    }
}
