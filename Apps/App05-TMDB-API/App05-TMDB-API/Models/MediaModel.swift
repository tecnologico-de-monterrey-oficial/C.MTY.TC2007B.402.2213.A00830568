//
//  MediaModel.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class MediaModel: ObservableObject {
    
    @Published var movies = [Media]()
    @Published var series = [Media]()
    
    
    init() {
        LoadMovies()
    }
    
    func LoadMovies() {
        
        movies.removeAll()
        
        
        let URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            
            let json = try! JSON(data: data.data!)
//            print(json)
            for result in json["results"] {
                var genre_ids = [Int]()
                for genre in result.1["genre_ids"] {
                    genre_ids.append(genre.1.intValue)
                }
                let media: Media = Media(id: result.1["id"].intValue,
                              title: result.1["title"].stringValue,
                              release_date: result.1["release_date"].stringValue,
                              adult: result.1["adult"].boolValue,
                              genre_ids: genre_ids,
                              overview: result.1["overview"].stringValue,
                              vote_average: result.1["vote_average"].doubleValue * 10,
                              poster_path: "\(imageURL)\(result.1["poster_path"].stringValue)",
                              backdrop_path: "\(imageURL)\(result.1["backdrop_path"].stringValue)")
                self.movies.append(media)
            }
            
        
        }
    }
    
}
