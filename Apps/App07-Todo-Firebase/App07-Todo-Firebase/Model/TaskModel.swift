//
//  TaskModel.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import SwiftUI
import FirebaseFirestore

class TaskModel: ObservableObject{
    @Published var tasks = [Task]()
    
    private let db = Firestore.firestore()
    
    init() {
        fetchTasks()
    }
    
    func fetchTasks(){
        db.collection("Tasks").order(by: "due_date").addSnapshotListener { (querySnapshot, error) in
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            print(documents.count)
            
            self.tasks = documents.compactMap { queryDocumentSnapshot -> Task? in
                return try? queryDocumentSnapshot.data(as: Task.self)
            }
            
        }
    }
}
