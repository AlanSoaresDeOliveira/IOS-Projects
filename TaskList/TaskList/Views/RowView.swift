//
//  RowView.swift
//  TaskList
//
//  Created by Alan Soares on 18/10/20.
//

import SwiftUI

struct RowView: View {
    var task: Task
    var body: some View {
        Text(task.name)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(task: Task(name: "TO DO"))
    }
}
