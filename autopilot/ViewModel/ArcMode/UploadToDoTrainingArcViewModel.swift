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
    case seatedArnoldPress
    case pushUps
    case plank
    case neutralGripInclineDumbbellBenchPress
    case lateralHipOpeners
    case latPulldown
    case kettlebellGobletSquats
    case inclinePushups
    case inclineDumbbellCurls
    case hipLifts
    case highPlankShoulderTaps
    case gobletDumbbellSplitSquats
    case facePull
    case facePullExternalRotation
    case dynamicHamstringStretch
    
    var exerciseName: String {
        switch self {
        case .wallPushUps: return "Wall Push Ups"
        case .vUps: return "V-ups"
        case .tripodDumbbellRows: return "Tripod Dumbbell Rows"
        case .stepUps: return "Step ups"
        case .sidePlank: return "Side Plank"
        case .seatedDumbbellOverhandPressNeutralGrip: return "Seated Dumbbell Overhand Press Neutral Grip"
        case .seatedArnoldPress: return "Seated Arnold Press"
        case .pushUps: return "Push-ups"
        case .plank: return "Plank"
        case .neutralGripInclineDumbbellBenchPress: return "Neutral Grip Incline Dumbbell Bench Press"
        case .lateralHipOpeners: return "Lateral Hip Openers"
        case .latPulldown: return "Lat Pulldown"
        case .kettlebellGobletSquats: return "Kettlebell Goblet Squats"
        case .inclinePushups: return "Incline Push-ups"
        case .inclineDumbbellCurls: return "Incline Dumbbell Curls"
        case .hipLifts: return "Hip Lifts"
        case .highPlankShoulderTaps: return "High Plank Shoulder Taps"
        case .gobletDumbbellSplitSquats: return "Goblet Dumbbell Split Squats"
        case .facePull: return "Face Pulls"
        case .facePullExternalRotation: return "Face Pulls External Rotation"
        case .dynamicHamstringStretch: return "Dynamic Hamstring Stretch"
    
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
        case .seatedArnoldPress: return "Seated-Arnold-Press"
        case .pushUps: return "Pushups"
        case .plank: return "Plank"
        case .neutralGripInclineDumbbellBenchPress: return "Neutral-Grip-Incline-Dumbbell-Bench-Press"
        case .lateralHipOpeners: return "Lateral-Hip-Openers"
        case .latPulldown: return "Lat-Pulldown"
        case .kettlebellGobletSquats: return "Kettlebell-Goblet-Squats"
        case .inclinePushups: return "Incline-Pushups"
        case .inclineDumbbellCurls: return "Incline-Dumbbell-Curls"
        case .hipLifts: return "Hip-Lifts"
        case .highPlankShoulderTaps: return "High-Plank-Sholder-Taps"
        case .gobletDumbbellSplitSquats: return "Goblet-Dumbbell-Split-Squats"
        case .facePull: return "Face-Pull"
        case .facePullExternalRotation: return "Face-Pull-External-Rotation"
        case .dynamicHamstringStretch: return "Dynamic-Hamstring-Stretch"
            
            
    
            
            
        }
    }
}

// Upload ToDo Training Arc
class UploadToDoTrainingArcViewModel: ObservableObject {
    
    
    
}
