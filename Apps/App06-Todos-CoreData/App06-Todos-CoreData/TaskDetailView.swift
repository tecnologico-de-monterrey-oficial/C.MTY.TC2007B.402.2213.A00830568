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
    var prioridades = [1, 2, 3]
    
    @State var taskEdit: String = ""
    @State var categoryEdit: String = "Fun"
    @State var categoryIndex = 0
    @State var priorityEdit: Int16 = 1
    @State var due_dateEdit: Date = Date()
    @State var date_createdEdit: Date = Date()
    @State var completedEdit: Bool = false
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack {
                Text("Nombre")
                    .font(.system(.largeTitle))
                TextField("Tarea", text: $taskEdit)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(.title))
            }.padding()
            VStack{
                Text("Categoría")
                    .font(.system(.title))
                Text(categoryEdit)
                
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
            }.padding([.bottom, .trailing, .leading])
            VStack{
                Text("Prioridad \(priorityEdit)")
                    .font(.system(.title))
                
                HStack {
                    ForEach(prioridades, id: \.self){ prioridad in
                        Text("\(prioridad)")
                            .font(.system(size: 25))
                            .opacity(priorityEdit == prioridad ? 1.0 : 0.3)
                            .onTapGesture {
                                priorityEdit = Int16(prioridad)
                            }
                    }
                }
            }.padding([.bottom, .trailing, .leading])
            VStack{
                Text("Fecha de entrega")
                    .font(.system(.title))
                Text(due_dateEdit, format: .dateTime.day().month().year())
                    .font(.system(size: 25))
                DatePicker("Selecciona una fecha", selection: $due_dateEdit, displayedComponents: [.date])
                    .font(.system(size: 20))
            }.padding([.bottom, .trailing, .leading])
            VStack{
                Text("Fecha de creación")
                    .font(.system(.title))
                Text(date_createdEdit, format: .dateTime.day().month().year())
                    .font(.system(size: 25))
            }.padding([.bottom, .trailing, .leading])
            HStack{
                Spacer()
                Text("Terminado")
                    .opacity(completedEdit == true ? 1.0 : 0.5)
                    .onTapGesture {
                        completedEdit = true
                    }
                    .foregroundColor(.green)
                Spacer()
                Text("No terminado")
                    .opacity(completedEdit == false ? 1.0 : 0.5)
                    .onTapGesture {
                        completedEdit = false
                    }
                    .foregroundColor(.red)
                Spacer()
            }.padding([.bottom, .trailing, .leading])
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
                priorityEdit = task.priority_wrapped
                due_dateEdit = task.due_date_wrapped
                date_createdEdit = task.date_created_wrapped
                completedEdit = task.completed_wrapped
            }
            else{
                taskEdit = ""
                categoryEdit = "Fun"
                priorityEdit = 1
                due_dateEdit = Date.now.addingTimeInterval(86400)
                date_createdEdit = Date.now
                completedEdit = false
            }
        }
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.id = UUID()
            newTask.task = taskEdit
            newTask.priority = priorityEdit
            newTask.category = categoryEdit
            newTask.due_date = due_dateEdit
            newTask.date_created = date_createdEdit
            newTask.completed = completedEdit
            
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
                task.priority = priorityEdit
                task.due_date = due_dateEdit
                task.date_created = date_createdEdit
                task.completed = completedEdit
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
