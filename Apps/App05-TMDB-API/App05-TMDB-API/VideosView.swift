//
//  VideosView.swift
//  App05-TMDB-API
//
//  Created by Edgar Alexandro on 25/08/22.
//

import SwiftUI

struct VideosView: View {
    
    @ObservedObject var mediaModel: MediaModel
    var mediaID: Int
    
    var body: some View {
        List{
            ForEach(mediaModel.videos){ video in
                NavigationLink(destination: {
                    WebView(html: "\(youtubeURL)\(video.key)")
                }, label:{
                    VStack(alignment: .leading){
                        Text(video.name)
                        Text(video.type)
                    }
                })
            }
        }
        .onAppear{
            mediaModel.getVideos(id: mediaID)
        }
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView(mediaModel: MediaModel(), mediaID: 1111111)
    }
}
