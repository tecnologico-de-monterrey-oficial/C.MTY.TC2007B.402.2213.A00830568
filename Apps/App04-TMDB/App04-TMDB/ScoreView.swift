//
//  ScoreView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct ScoreView: View {
    var score: Double
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 60, height: 60)
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.55)
                .foregroundColor(Color.black)
                .frame(width: 70, height: 70)
            withAnimation{
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(score / 100, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(ScoreColor(score: score))
                    .rotationEffect(Angle(degrees: 270.0))
                    .frame(width: 70, height: 70)
            }
            Text(String(format: "%.0f %%", min(score, 100.0)))
                .font(.body)
                .foregroundColor(.white)
                .bold()
        }
    }
    
    func ScoreColor(score: Double) -> Color {
        if score < 60 {
            return Color.red
        } else {
            if score >= 60 && score < 85 {
                return Color.yellow
            } else {
                return Color.green
            }
        }
    }
    
    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 70)
    }
}

