//
//  NewTaskView.swift
//  TaskList
//
//  Created by Alan Soares on 17/10/20.
//

import SwiftUI

struct NewTaskView: View {
    var taskStore: TaskStore
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var text = ""
    @State var priority: Task.Priority = .no
    
    var body: some View {
        Form {
            TextField("Task Name", text: $text)
            Button("Add") {
                let priotityIndex = self.taskStore.getIndex(for: self.priority)
                self.taskStore.prioritizedTasks[priotityIndex].tasks.append(
                    Task(name: self.text)
                )
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(text.isEmpty)
        }
    }
   
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore())
    }
}
