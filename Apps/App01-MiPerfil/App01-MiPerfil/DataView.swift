//
//  DataView.swift
//  App01-MiPerfil
//
//  Created by Edgar Alexandro on 11/08/22.
//

import SwiftUI

struct DataView: View {
    
    @Binding var program: String
    @Binding var age: Double
    
    var body: some View {
        VStack{
            Text("Actualiza los datos")
            TextField("Carrera", text: $program)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Edad: \(age, specifier: "%0.0f")")
            Slider(value: $age, in: 16...60)
        }
        .padding(.horizontal, 30)
    }
}

struct DataView_Previews: PreviewProvider {
    
    @State static var program: String = "ITC"
    @State static var age: Double = 19
    
    static var previews: some View {
        DataView(program: $program, age: $age)
    }
}
