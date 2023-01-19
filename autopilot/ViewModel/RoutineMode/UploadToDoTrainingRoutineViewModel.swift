//
//  UploadToDoTrainingArcViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/26/22.
//

import SwiftUI
import Firebase

// Sort of like our database. Cheaper and easier to store here.
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
    case dumbbellStepUps
    case dumbbellRows
    case dumbbellHammerCurls
    case dumbbellGobletSquats
    case dumbbellFrenchPress
    case dumbbellFlys
    case dumbbellDeadlifts
    case dumbbellCurls
    case dumbbellBenchPress
    case cossackSquats
    case bottomUpSquats
    case bodyweightSquats
    case bodyweightHipThrusts
    case birdDogs
    case barbellSquats
    case barbellBenchPress
    case barbellBenchHipThrusts
    
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
        case .dumbbellStepUps: return "Dumbbell Step ups"
        case .dumbbellRows: return "Dumbbell Rows"
        case .dumbbellHammerCurls: return "Dumbbell Hammer Curls"
        case .dumbbellGobletSquats: return "Dumbbell Goblet Squats"
        case .dumbbellFrenchPress: return "Dumbbell French Press"
        case .dumbbellFlys: return "Dumbbell Flys"
        case .dumbbellDeadlifts: return "Dumbbell Deadlifts"
        case .dumbbellCurls: return "Dumbbell Curls"
        case .dumbbellBenchPress: return "Dumbbell Bench Press"
        case .cossackSquats: return "Cossack Squats"
        case .bottomUpSquats: return "Bottom Up Squats"
        case .bodyweightSquats: return "Bodyweight Squats"
        case .bodyweightHipThrusts: return "Bodyweight Hip Thrusts"
        case .birdDogs: return "Bird Dogs"
        case .barbellSquats: return "Barbell Squats"
        case .barbellBenchPress: return "Barbell Bench Press"
        case .barbellBenchHipThrusts: return "Barbell Bench Hip Thrusts"
    
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
        case .dumbbellStepUps: return "Dumbbell-Step-Ups"
        case .dumbbellRows: return "Dumbbell-Rows"
        case .dumbbellHammerCurls: return "Dumbbell-Hammer-Curls"
        case .dumbbellGobletSquats: return "Dumbbell-Goblet-Squats"
        case .dumbbellFrenchPress: return "Dumbbell-French-Press"
        case .dumbbellFlys: return "Dumbbell-Flys"
        case .dumbbellDeadlifts: return "Dumbbell-Deadlifts"
        case .dumbbellCurls: return "Dumbbell-Curls"
        case .dumbbellBenchPress: return "Dumbbell-Bench-Press"
        case .cossackSquats: return "Cossack-Squats"
        case .bottomUpSquats: return "Bottom-Up-Squats"
        case .bodyweightSquats: return "Bodyweight-Squats"
        case .bodyweightHipThrusts: return "Bodyweight-Hip-Thrusts"
        case .birdDogs: return "Bird-Dogs"
        case .barbellSquats: return "Barbell-Squats"
        case .barbellBenchPress: return "Barbell-Bench-Press"
        case .barbellBenchHipThrusts: return "Barbell-Bench-Hip-geneThrusts"
            
            
    
            
            
        }
    }
}

// Upload ToDo Training Arc
class UploadToDoTrainingRoutineViewModel: ObservableObject {
    
    
    
}
