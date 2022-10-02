//
//  Category.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import Foundation

struct Category: Identifiable{
    
    var id: Int
    var category: String
    var image: String
    
}

extension Category {
    static let categories = [
        Category(id: 0, category: "Quiz", image: "quiz"),
        Category(id: 1, category: "Activity", image: "activity"),
        Category(id: 2, category: "Fun", image: "fun"),
        Category(id: 3, category: "Sports", image: "sports"),
    ]
}
