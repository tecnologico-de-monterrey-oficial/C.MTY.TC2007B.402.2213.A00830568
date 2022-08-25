//
//  MovieDetailView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct MediaDetailView: View {
    
    var media: Media
    
    var body: some View {
        VStack {
            Text(media.title)
                .padding()
//            NavigationLink {
//                WebView(html: media.trailer)
//            } label: {
//                Label("Trailer", systemImage: "film.fill")
//            }
            Text(media.overview)
                .padding()
//            TabView {
//                ForEach(media.images, id: \.self) { image in
            Image(media.backdrop_path)
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
        MediaDetailView(media: Media(id: 1, title: "", release_date: "", adult: false, genre_ids: [1,2], overview: "", vote_average: 10, poster_path: "", backdrop_path: ""))
    }
}
