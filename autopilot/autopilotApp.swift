//
//  autopilotApp.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI
import Firebase

@main
struct autopilotApp: App {
    let persistenceController = PersistenceController.shared
    
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
            
        }
    }
}
