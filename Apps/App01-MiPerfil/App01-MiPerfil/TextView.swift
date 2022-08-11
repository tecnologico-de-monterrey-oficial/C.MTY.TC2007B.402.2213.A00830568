//
//  TextView.swift
//  App01-MiPerfil
//
//  Created by Edgar Alexandro on 11/08/22.
//

import SwiftUI

struct TextView: View {
    var label: String = "Carrera"
    var value: String = "ITC"
    var body: some View {
        HStack{
            Text(label)
                .padding()
            Spacer()
            Text(value)
                .padding()
        }
        .padding(.horizontal, 20)
        //.frame(maxWidth: .infinity)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
