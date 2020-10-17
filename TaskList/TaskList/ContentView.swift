//
//  ContentView.swift
//  TaskList
//
//  Created by Alan Soares on 17/10/20.
//

import SwiftUI

struct ContentView: View {
    var taskStore: TaskStore
    
    var body: some View {
//        List(0 ..< taskStore.tasks.count) { index in
//            Text("\(taskStore.tasks[index].name)")
//        }
        List(taskStore.tasks) { task in
            Text(task.name)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
