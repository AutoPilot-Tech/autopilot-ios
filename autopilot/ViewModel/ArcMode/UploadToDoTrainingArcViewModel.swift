//
//  UploadToDoTrainingArcViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/26/22.
//

import SwiftUI
import Firebase

enum ExerciseOptions: Int, CaseIterable {
    case wallPushUps
    case vUps
    case tripodDumbbellRows
    case stepUps
    case sidePlank
    case seatedDumbbellOverhandPressNeutralGrip
    
    var exerciseName: String {
        switch self {
        case .wallPushUps: return "Wall Push Ups"
        case .vUps: return "V-ups"
        case .tripodDumbbellRows: return "Tripod Dumbbell Rows"
        case .stepUps: return "Step ups"
        case .sidePlank: return "Side Plank"
        case .seatedDumbbellOverhandPressNeutralGrip: return "Seated Dumbbell Overhand Press Neutral Grip"
    
        }
    }
    
    var videoName: String {
        switch self {
        case .wallPushUps: return "Wall-Push-Ups"
        case .vUps: return "V-Ups"
        case .tripodDumbbellRows: return "Tripod-Dumbbell-Rows"
        case .stepUps: return "Step-Ups"
        case .sidePlank: return "Side Plank"
        case .seatedDumbbellOverhandPressNeutralGrip: return "Seated-Dumbbell-Overhand-Press-Neutral-Grip"
    
            
            
        }
    }
}

// Upload ToDo Training Arc
class UploadToDoTrainingArcViewModel: ObservableObject {
    
    
    
}
