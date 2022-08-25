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
                .padding()
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(media.genres, id: \.self){ genre in
                        Text(genre)
                            .padding()
                    }
                }
                //.padding(.horizontal, 45)
            }
            NavigationLink {
                VideosView(mediaModel: mediaModel, mediaID: media.id)
            } label: {
                Label("Videos", systemImage: "film.fill")
            }
            Text(media.overview)
                .padding()
            //            TabView {
            //                ForEach(media.images, id: \.self) { image in
            
            KFImage(URL(string: media.backdrop_path))
                .resizable()
                .scaledToFit()
            //                }
            //            }
            //            .tabViewStyle(.page)
        }
        .foregroundColor(.blue)
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(mediaModel: MediaModel(), media: Media(id: 1, title: "", release_date: "", adult: false, genres: ["", ""], overview: "", vote_average: 10, poster_path: "", backdrop_path: ""))
    }
}
