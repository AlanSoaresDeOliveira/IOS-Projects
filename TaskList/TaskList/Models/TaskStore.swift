//
//  TaskStore.swift
//  TaskList
//
//  Created by Alan Soares on 17/10/20.
//

class TaskStore {
    var tasks = [
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
    
}
