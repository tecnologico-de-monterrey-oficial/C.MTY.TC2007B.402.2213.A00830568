//
//  ContentView.swift
//  App06-Todos-CoreData
//
//  Created by Edgar Alexandro on 01/09/22.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.priority, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                List {
                    ForEach(tasks) { task in
                        NavigationLink {
                            TaskDetailView(mode: .edit, task: task)
                        } label: {
                            TaskRowView(task: task)
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
                VStack {
                    NavigationLink {
                        TaskDetailView(mode: .add, task: Task())
                    } label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                }
//                .padding(.bottom, 60)
                
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
    
    
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
