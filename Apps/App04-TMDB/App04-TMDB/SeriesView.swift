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
        NavigationView{
            VStack{
                TabView{
                    ForEach(mediaModel.series){ serie in
                        NavigationLink{
                            SerieDetailView(serie: serie)
                        } label:{
                            SerieRowView(serie: serie)
                        }
                    }
                }
                .tabViewStyle(.page)
            }
            .navigationTitle("Series")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(mediaModel: MediaModel())
    }
}
