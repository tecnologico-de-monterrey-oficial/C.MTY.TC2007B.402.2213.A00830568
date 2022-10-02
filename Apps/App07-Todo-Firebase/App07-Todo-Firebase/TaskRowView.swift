//
//  TaskRowView.swift
//  App07-Todo-Firebase
//
//  Created by Edgar Alexandro on 21/09/22.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    var body: some View {
        VStack{
            HStack{
                Text(task.due_date, format: .dateTime.day().month().year())
                    .padding()
                Text(task.task)
                    .strikethrough(task.completed)
            }
            .opacity(task.completed == false ? 1.0 : 0.3)
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: Task.dummy)
    }
}
