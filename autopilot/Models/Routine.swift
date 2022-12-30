//
//  Routine.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/30/22.
//
import Foundation
import SwiftUI


// MARK: - ROUTINE STATUS

enum RoutineStatus {
    case notrunning
    case loading
    case running
    case error
}

// MARK: - ROUTINE DATA TYPE

class Routine: ObservableObject {
    @Published var elapsedTime: Double = 0
    @Published var currentActivity: Activity?
    @Published var routineStatus: RoutineStatus = .notrunning
    
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




// MARK: - ACTIVITY DATA TYPE


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

// MARK: - TEST ROUTINE

extension Routine {
    static let MOCK_ROUTINE = [
        Activity(types: [.coach]), // coach
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Dumbbell Bench Press", reps: 12, duration: 0, isTimed: false)]), // coach
        Activity(types: [.rest(duration: 45)]), // rest
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Dumbbell Bench Press", reps: 12, duration: 0, isTimed: false)]), // coach
        Activity(types: [.rest(duration: 45)]), // rest
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Dumbbell Bench Press", reps: 12, duration: 0, isTimed: false)]), // coach
        // TODO: add .coach to an exercise (the coach is giving instructions during exercise). Data structure supports this, but the UI might not at the moment.
        Activity(types: [.rest(duration: 90), .upnext]), //resting, and upnext to next block
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Incline Dumbbell Bench Press", reps: 12, duration: 0, isTimed: false)]), // exercise
        Activity(types: [.rest(duration: 90)]), //resting
        Activity(types: [.ready]), // get ready!
        Activity(types: [.exercise(name: "Incline Dumbbell Bench Press", reps: 12, duration: 0, isTimed: false)]), // exercise
        Activity(types: [.rest(duration: 90)]), //resting
        Activity(types: [.ready]), // get ready!
        Activity(types: [.exercise(name: "Incline Dumbbell Bench Press", reps: 12, duration: 0, isTimed: false)]), // exercise
        Activity(types: [.rest(duration: 90)]) //resting
]
        
}



