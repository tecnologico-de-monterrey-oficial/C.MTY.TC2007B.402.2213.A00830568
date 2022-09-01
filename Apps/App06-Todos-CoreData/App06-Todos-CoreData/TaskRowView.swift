//
//  TaskRowView.swift
//  App06-Todos-CoreData
//
//  Created by Edgar Alexandro on 01/09/22.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: Task
    
    var body: some View {
        VStack{
            HStack{
                Text("\(task.priority)")
                    .padding()
                Text(task.task_wrapped)
            }
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: Task())
    }
}
