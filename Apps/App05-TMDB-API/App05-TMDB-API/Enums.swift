//
//  Enums.swift
//  App05-TMDB-API
//
//  Created by Edgar Alexandro on 18/08/22.
//

import SwiftUI

enum Rated: String, CustomStringConvertible{
    case PG13 = "PG13"
    case PG = "PG"
    case TV14 = "TV14"
    case R = "R"
    case M = "M"
    case G = "G"
    case NR = "NR"
    var description: String {
        get {
            return self.rawValue
        }
    }
}
