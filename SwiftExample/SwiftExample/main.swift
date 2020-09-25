//
//  main.swift
//  SwiftExample
//
//  Created by Alan Soares on 25/09/20.
//  Copyright © 2020 Alan Soares. All rights reserved.
//

import Foundation

class Track {
    let name: String
    let instructor: String
    
    init(name: String, instructor: String) {
        self.name = name
        self.instructor = instructor
    }
}

let tracks = [
    Track(name: "Mobile", instructor: "Tommy"),
    Track(name: "Web", instructor: "Brian"),
    Track(name: "Games", instructor: "Colton")
]

let students = ["Harry", "Ron", "Hermione"]

var assigments: [String: Track] = [:]
for student in students {
    let track = Int.random(in: 0 ..< tracks.count)
    assigments[student] = tracks[track]
}

for (student, track) in assigments {
    print("\(student) got \(track.name) with \(track.instructor)")
}
