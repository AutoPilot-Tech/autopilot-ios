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
    case notrunning // before user hits start.
    case loading // before the routine begins - coach remarks.
    case running // the routine.
    case paused // user hits pause.
    case error // errors or unexpected behavior.
}

// MARK: - ROUTINE DATA TYPE / VIEW MODEL

class Routine: ObservableObject {
    // Create a timer source
    var timerSource: DispatchSourceTimer?
    private var isPaused = false  // for the Dispatch timer
    @Published var elapsedTime: Double = 0
    @Published var currentActivity: Activity?
    @Published var routineStatus: RoutineStatus = .notrunning
    @Published var timeRemaining: Double = 0
    @Published var timerValue: Int = 0
    @Published var activityIndex = 0

    
    // Activities - RoutineModeView will loop through these and display them for their duration.
    @Published var routine: [Activity] = [
        Activity(types: [.coach]), // coach
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Dumbbell-Bench-Press", reps: 12, duration: 0, isTimed: false)]), // coach
        Activity(types: [.rest(duration: 45)]), // rest
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Dumbbell-Bench-Press", reps: 12, duration: 0, isTimed: false)]), // coach
        Activity(types: [.rest(duration: 45)]), // rest
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Dumbbell-Bench-Press", reps: 12, duration: 0, isTimed: false)]), // coach
        // TODO: add .coach to an exercise (the coach is giving instructions during exercise). Data structure supports this, but the UI might not at the moment.
        Activity(types: [.rest(duration: 90), .upnext]), //resting, and upnext to next block
        Activity(types: [.ready]), // ready
        Activity(types: [.exercise(name: "Incline-Dumbbell-Press", reps: 12, duration: 0, isTimed: false)]), // exercise
        Activity(types: [.rest(duration: 90)]), //resting
        Activity(types: [.ready]), // get ready!
        Activity(types: [.exercise(name: "Incline-Dumbbell-Press", reps: 12, duration: 0, isTimed: false)]), // exercise
        Activity(types: [.rest(duration: 90)]), //resting
        Activity(types: [.ready]), // get ready!
        Activity(types: [.exercise(name: "Incline-Dumbbell-Press", reps: 12, duration: 0, isTimed: false)]), // exercise
        Activity(types: [.rest(duration: 90)]) //resting
]
    @Published var routineName: String
    @Published var routineCaption: String
    
    init() {
        routineName = "Friday's Workout"
        routineCaption = "Gang Shit!"
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
    // case task
    // case event
    // case selfcare
    // case habitbuilder
    // TODO: There will not be an activity type of "habit" until we can accurately quantify habits. Habits are much harder to quantify. Routines are "habit builders"
}


struct Activity {
    var name: String?
    var reps: Int?
    var duration: Int?
    var isTimed: Bool?
    var videoName: String?
    

    init(types: [ActivityType]) {
        for type in types {
            switch type {
                
            case .rest(let duration):
                self.name = "Rest"
                self.reps = 0
                self.duration = duration
                self.isTimed = true
                self.videoName = "Dumbbell-Bench-Press"
                
                // handle other cases
            case .coach:
                self.name = "Coach"
                self.reps = 0
                self.duration = 30
                self.isTimed = true
                self.videoName = "Dumbbell-Bench-Press"

                
            case .ready:
                self.name = "Get ready"
                self.reps = 0
                self.duration = 0
                self.isTimed = true
                self.videoName = "Dumbbell-Bench-Press"
            case .upnext:
                self.name = "Up next"
                self.reps = 0
                self.duration = 0
                self.isTimed = true
                self.videoName = "Dumbbell-Bench-Press"
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
                self.videoName = name
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



