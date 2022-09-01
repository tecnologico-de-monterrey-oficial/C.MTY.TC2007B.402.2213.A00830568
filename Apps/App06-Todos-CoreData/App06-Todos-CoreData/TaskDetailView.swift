//
//  TaskDetailView.swift
//  App06-Todos-CoreData
//
//  Created by Edgar Alexandro on 01/09/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    var task: Task
    
    var body: some View {
        VStack{
            Text("Task")
                .font(.system(.largeTitle))
            HStack{
                Text("Priority:")
                Text("\(task.priority)")
            }
            HStack{
                Text("Category:")
                Text("\(task.category_wrapped)")
            }
            HStack{
                Text("Task:")
                Text("\(task.task_wrapped)")
            }
            HStack{
                Text("Due Date:")
                Text("\(task.priority)")
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task())
    }
}
