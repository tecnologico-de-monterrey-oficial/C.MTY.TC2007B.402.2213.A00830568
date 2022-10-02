//
//  ContentView.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 19/09/22.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var taskModel = TaskModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                List {
                    ForEach(taskModel.tasks) { task in
                        NavigationLink {
                            TaskDetailView(taskModel: taskModel, mode: .edit, task: task)
                        } label: {
//                            Text(task.task)
                            TaskRowView(task: task)
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
                VStack {
//                    Spacer()
                    NavigationLink {
                        TaskDetailView(taskModel: taskModel, mode: .add, task: Task.dummy)
                    } label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                }
            }
            .background(Color("ColorLista"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationBarTitle("Lista de tareas", displayMode: .large)
        }
    }
    
    func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            taskModel.deleteTask(task: taskModel.tasks[index])
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
