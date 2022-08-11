//
//  Fonts.swift
//  App01-MiPerfil
//
//  Created by Edgar Alexandro on 11/08/22.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Roboto-Bold", size: 20 ))
            .foregroundColor(.white)
    }
}
