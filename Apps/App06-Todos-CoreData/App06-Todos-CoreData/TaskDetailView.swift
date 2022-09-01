//
//  TaskDetailView.swift
//  App06-Todos-CoreData
//
//  Created by Edgar Alexandro on 01/09/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    var task: Task
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
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
            if task.due_date != nil {
                HStack{
                    Text("Due Date:")
                    Text("\(dateFormatter.string(from: task.due_date!))")
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
