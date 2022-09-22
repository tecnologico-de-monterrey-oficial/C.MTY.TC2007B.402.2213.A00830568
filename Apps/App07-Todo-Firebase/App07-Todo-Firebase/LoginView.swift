//
//  LoginView.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import SwiftUI

struct LoginView: View {
    
    @AppStorage("Page") var currentPage: Page?
    
    var body: some View {
        VStack{
            Text("Bienvenido")
                .padding(.bottom, 40)
                .font(.largeTitle)
            Button{
                currentPage = .login
            }label: {
                Text("Login")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
