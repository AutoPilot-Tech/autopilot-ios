//
//  Routine.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/30/22.
//
import Foundation
import SwiftUI

class Routine: ObservableObject {
    @Published var elapsedTime: Double = 0
    @Published var currentActivity: Activity?
    
    // Activities
    @Published var routine: [Activity] = []
    
    func start() {
            // Start the timer and update the elapsed time
        }

        func pause() {
            // Pause the timer
        }

        func save() {
            // Save the attempted routine to the database
        }
}

enum ActivityType {
    case coach
    case ready
    case exercise(name: String, reps: Int, duration: Int, isTimed: Bool)
    case rest(duration: Int)
    case upnext
    case other
}

struct Activity {
    var name: String?
    var reps: Int?
    var duration: Int?
    var isTimed: Bool?
    

    init(types: [ActivityType]) {
        for type in types {
            switch type {
                
            case .rest(let duration):
                self.name = "Rest"
                self.reps = 0
                self.duration = duration
                self.isTimed = true
                
                // handle other cases
            case .coach:
                self.name = "Coach"
                self.reps = 0
                self.duration = 30
                self.isTimed = true
                
            case .ready:
                self.name = "Get ready"
                self.reps = 0
                self.duration = 0
                self.isTimed = true
            case .upnext:
                self.name = "Up next"
                self.reps = 0
                self.duration = 0
                self.isTimed = true
            case .other:
                self.name = "Other"
                self.reps = 0
                self.duration = 0
                self.isTimed = false
            case .exercise(name: let name, reps: let reps, duration: let duration, isTimed: let isTimed):
                self.name = name
                self.reps = reps
                self.duration = duration
                self.isTimed = isTimed
            }
        }
    }
}
