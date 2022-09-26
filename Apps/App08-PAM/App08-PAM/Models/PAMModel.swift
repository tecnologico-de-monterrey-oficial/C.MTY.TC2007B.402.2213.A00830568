//
//  PAMModel.swift
//  App08-PAM
//
//  Created by Edgar Alexandro on 26/09/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class PAMModel: ObservableObject{
    
    @Published var pams = [PAM]()
    
    init() {
        loadPAMs()
    }
    
    func loadPAMs(){
        pams.removeAll()
        let URL = "http://10.14.255.61:3000/api/getPams"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            let json = try! JSON(data: data.data!)
            print(json)
//            for genre in json["genres"] {
//                let g = Genre(id: genre.1["id"].intValue,
//                              name: genre.1["name"].stringValue
//                )
//                self.genresMovies.append(g)
//            }
        }
    }
}
