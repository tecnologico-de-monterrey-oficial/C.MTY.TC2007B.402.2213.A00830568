//
//  Media.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct Media: Identifiable{
    
    var id: Int
    var title: String
    var release_date: String
    var adult: Bool
    var genres: [String]
    var overview: String
    var vote_average: Double
    var poster_path: String
    var backdrop_path: String
}
