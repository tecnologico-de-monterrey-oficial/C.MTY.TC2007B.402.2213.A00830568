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
    var prioridades = [1, 2, 3]
    @State var task: Task
    
    var body: some View {
        VStack {
            VStack{
                Text(mode == .add ? "Agregar \(task.task)" : "Editar \(task.task)")
                    .padding(.top, 40)
                    .font(.largeTitle)
                TextField("Tarea", text: $task.task)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
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
            VStack{
                Text("Prioridad \(task.priority)")
                    .font(.system(.title))
                
                HStack {
                    ForEach(prioridades, id: \.self){ prioridad in
                        Text("\(prioridad)")
                            .font(.system(size: 25))
                            .opacity(task.priority == prioridad ? 1.0 : 0.3)
                            .onTapGesture {
                                task.priority = prioridad
                            }
                    }
                }
            }.padding([.bottom, .trailing, .leading])
            VStack{
                Text("Fecha de entrega")
                    .font(.system(.title))
                Text(task.due_date, format: .dateTime.day().month().year())
                    .font(.system(size: 25))
                DatePicker("Selecciona una fecha", selection: $task.due_date, displayedComponents: [.date])
                    .font(.system(size: 20))
            }.padding([.bottom, .trailing, .leading])
            VStack{
                Text("Fecha de creación")
                    .font(.system(.title))
                Text(task.date_created, format: .dateTime.day().month().year())
                    .font(.system(size: 25))
            }.padding([.bottom, .trailing, .leading])
            HStack{
                Spacer()
                Text("Terminado")
                    .opacity(task.completed == true ? 1.0 : 0.5)
                    .onTapGesture {
                        task.completed = true
                    }
                    .foregroundColor(.green)
                Spacer()
                Text("No terminado")
                    .opacity(task.completed == false ? 1.0 : 0.5)
                    .onTapGesture {
                        task.completed = false
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
        .padding(.bottom, 20)
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
