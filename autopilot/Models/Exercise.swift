//
//  Exercise.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/1/22.
//

import Foundation


struct Exercise {
    let exerciseName: String
    let videoName: String
    let duration: Int
    
    
    enum ExerciseEnum: String {
        case squat = "Squat"
        case stepUp = "Step Up"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
    }
}

extension Exercise {
    static let exercises = [
    
        Exercise(exerciseName: ExerciseEnum.squat.rawValue, videoName: "squat", duration: 60),
        Exercise(exerciseName: ExerciseEnum.stepUp.rawValue, videoName: "step-up", duration: 60),

        Exercise(exerciseName: ExerciseEnum.burpee.rawValue, videoName: "burpee", duration: 60),

        Exercise(exerciseName: ExerciseEnum.sunSalute.rawValue, videoName: "sun-salute", duration: 60),

        
        ]}
