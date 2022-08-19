//
//  MovieDetailView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    var movie: Media
    
    var body: some View {
        VStack{
            Text(movie.name)
                .font(.custom("Aboreto-Regular", size: 35))
                .multilineTextAlignment(.center)
                .padding(.all, 5)
            
            ScrollView{
                Text(movie.headline)
                    .padding(.vertical, 10)
                    .font(.custom("Quintessential-Regular", size: 20))
                TabView{
                    ForEach(movie.images, id: \.self){image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame( height: 400)
                Text(movie.duration)
                    .font(.custom("SpecialElite-Regular", size: 18))
                    .padding(.top, 2)
                Text(movie.rated.rawValue)
                    .font(.custom("Silkscreen-Regular", size: 18))
                    .padding(.bottom, 2)
                HStack{
                    ForEach(movie.genre, id: \.self){genre in
                        Text(genre)
                            .font(.custom("SpecialElite-Regular", size: 18))
                            .padding(.horizontal, 5)
                    }
                }
                Text(movie.overview)
                    .font(.custom("PoiretOne-Regular", size: 22))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }
            NavigationLink{
                WebView(html: movie.trailer)
            } label: {
                Label("Trailer", systemImage: "film.fill")
            }
            .padding(.all, 5)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Media(name: "The Tomorrow War ", year: 2021, rated: .PG13, genre: ["Action", "Science Fiction", "Adventure"], duration: "2h 18m", headline: "The fight for tomorrow begins today.", overview: "The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.", score: 78, images: ["TheTomorrowWar1","TheTomorrowWar2","TheTomorrowWar3","TheTomorrowWar4","TheTomorrowWar5"], trailer: "https://youtu.be/RQjEbkV-9ZM"))
    }
}
