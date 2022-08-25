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
        NavigationView {
            VStack {
                if mediaModel.movies.count > 0 {
                    TabView {
                        ForEach(mediaModel.movies) { movie in
                            NavigationLink {
                                MediaDetailView(media: movie)
                            } label: {
                                MediaRowView(media: movie)
                            }
                        }
                    }
                    .tabViewStyle(.page)
                } else {
                    Text("No hay películas")
                }
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
