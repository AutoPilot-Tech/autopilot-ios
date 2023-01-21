//
//  ViewRouter.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI


class AutopilotViewRouter: ObservableObject {
    @Published var currentPage: Page = .workspace
    @Published var currentRecommended: RecommendedView = .workouts
    @Published var slideTabShowing: Bool = true
    
    static let shared = AutopilotViewRouter()
}



enum Page {
    case home
    case explore
    case arcDetail
    case arcMode
    case profile
    case coachChat
    case workouts
    case recommended
    case tasks
    case workoutGen
    case schedule
    case workspace
}


enum RecommendedView {
    case home
    case explore
    case general
    case arcDetail
    case arcMode
    case profile
    case coachChat
    case workouts
    case recommended
    case tasks
    case workoutGen
    case schedule
}
