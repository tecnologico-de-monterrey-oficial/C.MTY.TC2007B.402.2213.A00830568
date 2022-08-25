//
//  ContentView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        TabView {
            MoviesView(mediaModel: mediaModel)
                .tabItem {
                    Label("Movies", systemImage: "film.fill")
                }
            SeriesView(mediaModel: mediaModel)
                .tabItem {
                    Label("Series", systemImage: "tv.fill")
                }
        }
        .accentColor(.red)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
