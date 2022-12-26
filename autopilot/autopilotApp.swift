//
//  autopilotApp.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI
import Firebase

public class UIStateModel: ObservableObject {
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
}

@main
struct autopilotApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate


    
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(autopilotViewRouter: AutopilotViewRouter.shared).environmentObject(AuthViewModel.shared)
        }
    }
}
