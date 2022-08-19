//
//  SerieDetailView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct SerieDetailView: View {
    var serie: Media
    
    var body: some View {
        VStack{
            Text(serie.name)
                .font(.custom("Aboreto-Regular", size: 35))
                .multilineTextAlignment(.center)
                .padding(.all, 5)
            
            ScrollView{
                Text(serie.headline)
                    .padding(.vertical, 10)
                    .font(.custom("Quintessential-Regular", size: 20))
                TabView{
                    ForEach(serie.images, id: \.self){image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame( height: 400)
                Text(serie.duration)
                    .font(.custom("SpecialElite-Regular", size: 18))
                    .padding(.top, 2)
                Text(serie.rated.rawValue)
                    .font(.custom("Silkscreen-Regular", size: 18))
                    .padding(.bottom, 2)
                HStack{
                    ForEach(serie.genre, id: \.self){genre in
                        Text(genre)
                            .font(.custom("SpecialElite-Regular", size: 18))
                            .padding(.horizontal, 5)
                    }
                }
                Text(serie.overview)
                    .font(.custom("PoiretOne-Regular", size: 22))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }
            NavigationLink{
                WebView(html: serie.trailer)
            } label: {
                Label("Trailer", systemImage: "film.fill")
            }
            .padding(.all, 5)
        }
    }
}

struct SerieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailView(serie: Media(name: "WandaVision", year: 2021, rated: .TV14, genre: ["Sci-Fi & Fantasy", "Mystery", "Drama"], duration: "36m", headline: "Experience a new vision of reality.", overview: "Wanda Maximoff and Vision—two super-powered beings living idealized suburban lives—begin to suspect that everything is not as it seems.", score: 85, images: ["WandaVision1","WandaVision2","WandaVision3","WandaVision4","WandaVision5"], trailer: "https://youtu.be/sj9J2ecsSpo"))
    }
}
