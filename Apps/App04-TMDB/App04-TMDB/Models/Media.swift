//
//  Media.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

struct Media: Identifiable{
    
    var id = UUID()
    var name: String
    var year: Int
    var rated: Rated
    var genre: [String]
    var duration: String
    var headline: String
    var overview: String
    var score: Double
    var images: [String]
    var trailer: String
}
