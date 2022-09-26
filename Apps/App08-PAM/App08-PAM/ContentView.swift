//
//  ContentView.swift
//  App08-PAM
//
//  Created by Edgar Alexandro on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pamModel = PAMModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
