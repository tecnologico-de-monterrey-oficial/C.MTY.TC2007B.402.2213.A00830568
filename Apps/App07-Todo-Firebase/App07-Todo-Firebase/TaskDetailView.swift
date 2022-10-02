//
//  TaskDetailView.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var taskModel: TaskModel
    var mode: Mode
    @State var task: Task
    
    var body: some View {
        VStack {
            Text(mode == .add ? "Agregar Tarea" : "Editar Tarea")
                .padding(.top, 40)
                .font(.largeTitle)
            TextField("Tarea", text: $task.task)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            VStack{
                Text("Categoría")
                    .font(.system(.title))
                Text(task.category)
                HStack{
                    ForEach(Category.categories){ category in
                        Image(category.image)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding(.horizontal, 10)
                            .opacity(task.category == category.category ? 1.0 : 0.3)
                            .onTapGesture {
                                task.category = category.category
                            }
                    }
                }
            }.padding([.bottom, .trailing, .leading])
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
    }
    
    func addTask() {
        taskModel.addTask(task: task)
    }
    
    func editTask() {
        taskModel.updateTask(task: task)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), mode: .add, task: Task.dummy)
    }
}
