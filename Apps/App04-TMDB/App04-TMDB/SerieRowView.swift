//
//  SerieRowView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct SerieRowView: View {
    var serie: Media
    
    var body: some View {
        VStack{
            Text(serie.name)
                .foregroundColor(.cyan)
            Text(String(serie.year))
                .foregroundColor(.gray)
            Image(serie.images[0])
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(
                    VStack{
                        Spacer()
                        HStack{
                            ScoreView(score: serie.score)
                                .padding(.leading, 30)
                                .padding(.bottom, -35)
                            Spacer()
                        }
                    }
                )
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 55)
    }
}

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        SerieRowView(serie: Media(name: "WandaVision", year: 2021, rated: .TV14, genre: ["Sci-Fi & Fantasy", "Mystery", "Drama"], duration: "36m", headline: "Experience a new vision of reality.", overview: "Wanda Maximoff and Vision—two super-powered beings living idealized suburban lives—begin to suspect that everything is not as it seems.", score: 85, images: ["WandaVision1","WandaVision2","WandaVision3","WandaVision4","WandaVision5"], trailer: "https://youtu.be/sj9J2ecsSpo"))
    }
}
