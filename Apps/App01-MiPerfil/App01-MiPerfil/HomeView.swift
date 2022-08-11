//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by Edgar Alexandro on 11/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var name: String = "Edgar Castillo"
    @State var program: String = "ITC"
    @State var age: Double = 19
    @State var dob: Date = Date()
    @State var city: String = "Monterrey"
    @State var showView: Bool = false
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack(spacing: 0){
                    ZStack{
                        Color.blue
                        VStack{
                            //Text("Nombre: \(name)")
                            Text(name)
                                .foregroundColor(.white)
                                .font(.custom("Roboto-Italic", size: 40))
                        }
                    }
                    .frame(height: geo.size.height/3)
                    VStack{
                        Color.red
                    }
                    .frame(height: geo.size.height/3*2)
                }
                ZStack{
                    VStack{
                        Circle()
                            .padding(.bottom, geo.size.height/3)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    }
                    VStack {
                        Image("perro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 6)
                                    .foregroundColor(.white)
                            )
                            .padding(.bottom, geo.size.height/3)
                    }
                    VStack{
                        VStack{
                            TextView(label: "Carrera: ", value: program)
                            TextView(label: "Edad: ", value: "\(age)")
                            TextView(label: "Fecha de Nacimiento: ", value: "\(dateFormat.string(from: dob))")
                            TextView(label: "Ciudad: ", value: city)
                        }
                        .modifier(TextModifier())
                        Spacer()
                        Button {
                            showView.toggle()
                        } label: {
                            Text("Actualiza datos")
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    .blue
                                )
                                .cornerRadius(20)
                        }
                        
                    }
                    .modifier(TextModifier())
                    .padding(.top, geo.size.height/3 + 100)
                    .padding(.bottom, 60)
                }
            }
            .sheet(isPresented: $showView){
                DataView(program: $program, age: $age)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
