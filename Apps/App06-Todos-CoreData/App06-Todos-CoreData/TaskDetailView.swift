//
//  TaskDetailView.swift
//  App06-Todos-CoreData
//
//  Created by Edgar Alexandro on 01/09/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    var mode: Mode = .add
    var task: Task
    @State var taskEdit: String = ""
    @State var categoryEdit: String = "Fun"
    @State var categoryIndex = 0
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack {
                Text("Task")
                    .font(.system(.largeTitle))
                TextField("Tarea", text: $taskEdit)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(.title))
            }
            VStack{
                Text("Categoría")
                Text(categoryEdit)
                    .font(.system(.title))
            }
            HStack{
                ForEach(Category.categories){ category in
                    Image(category.image)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.horizontal, 10)
                        .opacity(categoryEdit == category.category ? 1.0 : 0.3)
                        .onTapGesture {
                            categoryEdit = category.category
                        }
                }
            }
            //            HStack {
            //                Text("Priority:")
            //                Text("\(task!.priority)")
            //            }
            //            HStack {
            //                Text("Category:")
            //                Text("\(task!.category_wrapped)")
            //            }
            //            HStack {
            //                Text("Task:")
            //                Text("\(task!.task_wrapped)")
            //            }
            //            if task!.due_date != nil {
            //                HStack {
            //                    Text("Due Date:")
            //                    Text("\(dateFormatter.string(from: task!.due_date!))")
            //                }
            //            }
            Spacer()
            Button {
                if mode == .add {
                    addTask()
                } else {
                    editTask()
                }
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text(mode == .add ? "Agregar" : "Editar")
                    .font(.system(.largeTitle))
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
        }
        .padding(.horizontal, 20)
        .onAppear {
            if mode == .edit {
                taskEdit = task.task_wrapped
                categoryEdit = task.category_wrapped
            }
            else{
                taskEdit = ""
                categoryEdit = "Fun"
            }
        }
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.id = UUID()
            newTask.task = taskEdit
            newTask.priority = 1
            newTask.category = categoryEdit
            newTask.due_date = Date()
            newTask.completed = false
            
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
    
    private func editTask() {
        withAnimation {
            viewContext.performAndWait {
                
                task.task = taskEdit
                task.category = categoryEdit
                //            newTask.priority = 1
                //            newTask.category = "Clase"
                //            newTask.due_date = Date()
                //            newTask.completed = false
                
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
    
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task())
    }
}
