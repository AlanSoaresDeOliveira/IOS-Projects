//
//  TaskStore.swift
//  TaskList
//
//  Created by Alan Soares on 17/10/20.
//
import Combine

class TaskStore: ObservableObject {
    @Published var tasks = [
        "Code a SwiftUI app",
        "Book an escape room",
        "Walk the car",
        "Pick up heavy things and put them down",
        "Make Karaoke playlist",
        "Present at IOS meetup group",
        "Climb El Capitan",
        "Learn to make baklava",
        "Play disc golf in every state",
        "100 movie reboot marathon"
    ].map { Task(name: $0)}
    
    @Published var prioritizedTasks = [
        PrioritizedTasks(
            priority: .high,
            names: [
                "Code a SwiftUI app",
                "Book an escape room",
                "Walk the car",
                "Pick up heavy things and put them down"
            ]
        ),
        
        PrioritizedTasks(
            priority: .medium,
            names: [
                "Make Karaoke playlist",
                "Present at IOS meetup group"
            ]
        ),
        PrioritizedTasks(
            priority: .low,
            names: [
                "Climb El Capitan"
            ]
        ),
        PrioritizedTasks(
            priority: .no,
            names: [
                "Learn to make baklava",
                "Play disc golf in every state",
                "100 movie reboot marathon"
            ]
        ),
    ]
}

private extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(priority: priority, tasks: names.map { Task(name: $0)} )
    }
}
