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
    @Published var genresMovies = [Genre]()
    @Published var videos = [Video]()
    
    
    init() {
        LoadData()
    }
    
    func LoadData(){
        genresMovies.removeAll()
        let URL = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apikey)&language=en-US"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for genre in json["genres"] {
                let g = Genre(id: genre.1["id"].intValue,
                              name: genre.1["name"].stringValue
                )
                self.genresMovies.append(g)
            }
        }
        self.LoadMovies()
    }
    
    func LoadMovies() {
        movies.removeAll()
        let URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            
            let json = try! JSON(data: data.data!)
//            print(json)
            for result in json["results"] {
                var genres = [String]()
                for genreInt in result.1["genre_ids"] {
                    if let genreName = self.genresMovies.first(where: {$0.id == genreInt.1.intValue}){
                        genres.append(genreName.name)
                    }
                    
                }
                let media: Media = Media(id: result.1["id"].intValue,
                              title: result.1["title"].stringValue,
                              release_date: result.1["release_date"].stringValue,
                              adult: result.1["adult"].boolValue,
                              genres: genres,
                              overview: result.1["overview"].stringValue,
                              vote_average: result.1["vote_average"].doubleValue * 10,
                              poster_path: "\(imageURL)\(result.1["poster_path"].stringValue)",
                              backdrop_path: "\(imageURL)\(result.1["backdrop_path"].stringValue)")
                self.movies.append(media)
            }
        }
    }
    
    func getVideos(id: Int){
        videos.removeAll()
        let URL = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apikey)&language=en-US"
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            
            let json = try! JSON(data: data.data!)
            for result in json["results"] {
                let video: Video = Video(id: result.1["id"].stringValue,
                                         name: result.1["name"].stringValue,
                                         key: result.1["key"].stringValue,
                                         site: result.1["site"].stringValue,
                                         type: result.1["type"].stringValue)
                self.videos.append(video)
            }
        }
    }
    
}
