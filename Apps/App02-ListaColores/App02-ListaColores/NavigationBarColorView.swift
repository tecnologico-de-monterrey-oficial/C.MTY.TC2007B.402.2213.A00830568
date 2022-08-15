//
//  NavigationBarColorView.swift
//  App02-ListaColores
//
//  Created by Edgar Alexandro on 15/08/22.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    
    
    init(backgroundColor: UIColor?, fontColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: fontColor!]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: fontColor!]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = fontColor

    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?, _ fontColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, fontColor: fontColor))
    }

}
