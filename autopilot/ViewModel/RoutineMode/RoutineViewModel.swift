//
//  RoutineViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/30/22.
//

import SwiftUI

class RoutineViewModel: ObservableObject {
    @Published var routine: Routine
    @Published var isPaused = false
    @Published var isQuitPromptShowing = false
    @Published var isBottomSheetShowing = false
    
    
    init(routine: Routine) {
            self.routine = routine
        }
    
    func saveRoutine() {
            routine.save()
        }
    
}

