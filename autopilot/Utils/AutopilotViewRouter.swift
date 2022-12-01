//
//  ViewRouter.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI


class AutopilotViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
    
    static let shared = AutopilotViewRouter()
}



enum Page {
    case home
    case explore
    case arcDetail
    case arcMode
    case profile
    case coachChat
}
