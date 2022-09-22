//
//  Task.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Task: Identifiable, Codable {
    
    @DocumentID var id: String?
    var task: String
    var category: String
    var priority: Int
    var completed: Bool
    var date_created: Date
    var due_date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case task
        case category
        case priority
        case completed
        case date_created
        case due_date
        
    }
    
}

extension Task {
    
    static let dummy = Task(task: "", category: "fun", priority: 1, completed: false, date_created: Date(), due_date: Date())
}
