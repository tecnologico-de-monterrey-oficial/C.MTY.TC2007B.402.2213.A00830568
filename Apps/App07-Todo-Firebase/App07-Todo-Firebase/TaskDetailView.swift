//
//  TaskDetailView.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var mode: Mode
    @State var task: Task
    
    var body: some View {
        VStack{
            Text(mode == .add ? "Agregar tarea" : "Editar tarea")
                .padding(.top, 40)
                .font(.largeTitle)
            TextField("Tarea", text: $task.task)
                .textFieldStyle(RoundedBorderTextFieldStyle())
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
    }
    
    func addTask(){

    }
    
    func editTask(){
        
    }
    
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(mode: .add, task: Task.dummy)
    }
}
