//
//  TaskModel.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import SwiftUI
import FirebaseFirestore

class TaskModel: ObservableObject {
    
    @Published var tasks = [Task]()
    
    private let db = Firestore.firestore()
    
    init() {
        fetchTasks()
    }
    
    func fetchTasks() {
        
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
    
    // Función para agregar datos a la base de datos
    func addTask(task: Task) {
        do {
            let _ = try db.collection("Tasks").addDocument(from: task)
        }
        catch {
            print(error)
        }
    }
    
    // Función para actualizar datos en la base de datos
    func updateTask(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("Tasks").document(taskID).setData(from: task)
            }
            catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }
    
    // Función para borrar datos de la base de datos
    func deleteTask(task: Task) {
        if let taskID = task.id {
            db.collection("Tasks").document(taskID).delete { (error) in // (1)
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
