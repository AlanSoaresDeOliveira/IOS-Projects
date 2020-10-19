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
            List {
                ForEach(taskStore.tasks) { index in
                    RowView(task: self.$taskStore.tasks[index])
                    
                }
                .onMove{ surceIndices, destinationIndex in
                    self.taskStore.tasks.move(fromOffsets: surceIndices, toOffset: destinationIndex)
                }
                .onDelete { indexSet in
                    self.taskStore.tasks.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
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


