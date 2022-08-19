//
//  DogView.swift
//  App03-Listas
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct DogView: View {
    
    @State var nomImg: String
    
    var body: some View {
        ZStack{
            Color.purple.opacity(0.7)
                .ignoresSafeArea(.all)
            VStack{
                Image(nomImg)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.all, 25)
                Text(nomImg)
                    .font(.custom("AkayaTelivigala-Regular", size: 50))
                    .padding()
            }
        }
    }
}

struct DogView_Previews: PreviewProvider {
    
    @State static var nomImg: String = "Perro"
    
    static var previews: some View {
        DogView(nomImg: "Chihuahua")
    }
}
