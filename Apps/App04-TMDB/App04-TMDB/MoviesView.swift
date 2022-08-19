//
//  MoviesView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var mediaModel: MediaModel
    
    var body: some View {
        NavigationView{
            VStack{
                TabView{
                    ForEach(mediaModel.movies){ movie in
                        NavigationLink{
                            MovieDetailView(movie: movie)
                        } label:{
                            MovieRowView(movie: movie)
                        }
                    }
                }
                .tabViewStyle(.page)
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(mediaModel: MediaModel())
    }
}
