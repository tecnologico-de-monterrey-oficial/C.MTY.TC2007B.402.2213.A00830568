//
//  Constants.swift
//  App05-TMDB-API
//
//  Created by Edgar Alexandro on 22/08/22.
//

import Foundation

let apikey = "72bbfb0c3f20786f6d1c4c88c9a48172"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MmJiZmIwYzNmMjA3ODZmNmQxYzRjODhjOWE0ODE3MiIsInN1YiI6IjYzMDM5NDU3MjExMThmMDA4MGEwZGRjYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.a5jq_neWypR2Ju2Sp_GzT94lcfVBJgAQVdutbws_74U"
let headers = [ "Authorization": "Bearer \(apiauth)", "Accept": "application/json", "Content-Type": "application/json" ]
let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original"
let youtubeURL = "https://youtu.be/"
