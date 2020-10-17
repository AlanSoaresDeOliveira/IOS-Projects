//
//  Task.swift
//  TaskList
//
//  Created by Alan Soares on 17/10/20.
//
import Foundation

struct Task: Identifiable {
    let id = UUID()
    
    var name: String
    var completed = false
}
