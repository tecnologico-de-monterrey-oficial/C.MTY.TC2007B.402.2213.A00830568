//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by Edgar Alexandro on 08/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Text("Hello, world!")
                    .padding([.top, .leading, .bottom, .trailing], 50)
                    .foregroundColor(Color.white)
                    .font(.system(.largeTitle))
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
