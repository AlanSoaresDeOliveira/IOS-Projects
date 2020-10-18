//
//  ContentView.swift
//  TaskList
//
//  Created by Alan Soares on 17/10/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore: TaskStore
    
    @State var modalIsPresented = false
    
    var body: some View {
        NavigationView {
            List(taskStore.tasks) { task in
                Text(task.name)
                
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                trailing:
                    Button(action: { self.modalIsPresented = true}) {
                        Image(systemName: "plus")
                    }
            )
        }
        .sheet(isPresented: $modalIsPresented) {
            NewTaskView(taskStore: self.taskStore)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
