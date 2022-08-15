//
//  ColorView.swift
//  App02-ListaColores
//
//  Created by Edgar Alexandro on 15/08/22.
//

import SwiftUI

struct ColorView: View {
    
    var colour: Colour
    
    var body: some View {
        ZStack {
            colour.colour
            VStack {
                if colour.dark {
                    Text(colour.name)
                        .foregroundColor(.white)
                } else {
                    Text(colour.name)
                        .foregroundColor(.black)
                }
            }
        }
        .navigationTitle(colour.name)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(colour: Colour.Alizarin)
    }
}
