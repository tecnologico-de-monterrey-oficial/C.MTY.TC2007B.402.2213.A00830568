//
//  MovieDetailView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI
import Kingfisher

struct MediaDetailView: View {
    
    @ObservedObject var mediaModel: MediaModel
    var media: Media
    
    var body: some View {
        VStack {
            Text(media.title)
                .font(.custom("Aboreto-Regular", size: 35))
                .multilineTextAlignment(.center)
                .padding(.all, 5)
            Text(media.release_date)
                .font(.custom("Silkscreen-Regular", size: 18))
            ScrollView(showsIndicators: false){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(media.genres, id: \.self){ genre in
                            Text(genre)
                                .font(.custom("SpecialElite-Regular", size: 18))
                                .padding()
                        }
                    }
                    
                }
                .padding(.horizontal, 45)
                KFImage(URL(string: media.backdrop_path))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                Text(media.overview)
                    .font(.custom("PoiretOne-Regular", size: 22))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
            }
            NavigationLink {
                VideosView(mediaModel: mediaModel, mediaID: media.id)
            } label: {
                Label("Videos", systemImage: "film.fill")
            }
            .foregroundColor(.purple)
        }
        .foregroundColor(.white)
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(mediaModel: MediaModel(), media: Media(id: 1, title: "", release_date: "", adult: false, genres: ["", ""], overview: "", vote_average: 10, poster_path: "", backdrop_path: ""))
    }
}
