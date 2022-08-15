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
    @Binding var dob: Date
    @Binding var state: String
    
    let states = ["Aguascalientes","Baja California","Baja California Sur","Campeche","Chiapas","Chihuahua","Coahuila de Zaragoza","Colima","Ciudad de México","Durango","Guanajuato","Guerrero","Hidalgo","Jalisco","Estado de Mexico","Michoacan de Ocampo","Morelos","Nayarit","Nuevo León","Oaxaca","Puebla","Queretaro de Arteaga","Quintana Roo","San Luis Potosi","Sinaloa","Sonora","Tabasco","Tamaulipas","Tlaxcala","Veracruz de Ignacio de la Llave","Yucatan","Zacatecas"]
    
    var body: some View {
        ZStack{
            Color.brown
                .ignoresSafeArea()
            VStack{
                Text("Actualiza los datos")
                HStack{
                    Text("Carrera:")
                    TextField("Carrera", text: $program)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.all, 7)
                        .background(RoundedRectangle(cornerRadius: 9).fill(Color.white))
                }
                HStack{
                    Text("Edad: \(age, specifier: "%0.0f")")
                    Slider(value: $age, in: 16...60)
                }
                //Text("Fecha de Nacimiento")
                DatePicker("Fecha de Nacimiento:", selection: $dob, displayedComponents: [.date])
                HStack{
                    Text("Estado:")
                    Spacer()
                    Picker("Selecciona un estado", selection: $state) {
                        ForEach(states, id: \.self) {
                            Text($0)
                        }
                    }
                    //.pickerStyle(.menu)
                }
            }
            .padding(.horizontal, 30)
        }
        .foregroundColor(.black)
        //.font(.custom("Roboto-Italic", size: 22))
    }
}

struct DataView_Previews: PreviewProvider {
    
    @State static var program: String = "ITC"
    @State static var age: Double = 19
    @State static var dob: Date = Date()
    @State static var state: String = "Nuevo León"
    
    static var previews: some View {
        DataView(program: $program, age: $age, dob: $dob, state: $state)
    }
}
