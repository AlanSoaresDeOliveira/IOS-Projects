//
//  SectionView.swift
//  TaskList
//
//  Created by Alan Soares on 20/10/20.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioritizedTasks: TaskStore.PrioritizedTasks
    
    var body: some View {
        Section(
            header: Text(
                "\(prioritizedTasks.priority.rawValue.capitalized) Priority"
            )
        )   {
            ForEach(prioritizedTasks.tasks) { index in
                RowView(task: self.$prioritizedTasks.tasks[index])
                
            }
            .onMove{ surceIndices, destinationIndex in
                self.prioritizedTasks.tasks.move(fromOffsets: surceIndices, toOffset: destinationIndex)
            }
            .onDelete { indexSet in
                self.prioritizedTasks.tasks.remove(atOffsets: indexSet)
            }
        }
    }
}


