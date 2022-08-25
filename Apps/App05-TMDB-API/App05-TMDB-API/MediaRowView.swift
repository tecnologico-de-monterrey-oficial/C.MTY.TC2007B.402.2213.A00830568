//
//  MovieDetailView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI
import Kingfisher

struct MediaRowView: View {
    
    var media: Media
    
    var body: some View {
        VStack {
            Text(media.title)
                .foregroundColor(.cyan)
//            Image(media.poster_path)
            KFImage(URL(string: media.poster_path))
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            ScoreView(score: media.vote_average)
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

struct MediaRowView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRowView(media: Media(id: 1, title: "", release_date: "", adult: false, genre_ids: [1,2], overview: "", vote_average: 10, poster_path: "", backdrop_path: ""))
    }
}
