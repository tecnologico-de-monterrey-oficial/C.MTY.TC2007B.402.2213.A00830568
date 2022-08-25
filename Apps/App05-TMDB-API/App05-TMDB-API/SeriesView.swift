//
//  SeriesView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct SeriesView: View {
    
    @ObservedObject var mediaModel: MediaModel
    
    var body: some View {
        NavigationView {
            VStack {
                if mediaModel.series.count > 0 {
                    TabView {
                        ForEach(mediaModel.series) { serie in
                            NavigationLink {
                                MediaDetailView(media: serie)
                            } label: {
                                MediaRowView(media: serie)
                            }
                            
                            
                        }
                    }
                    .tabViewStyle(.page)
                } else {
                    Text("No hay series")
                }
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(mediaModel: MediaModel())
    }
}
