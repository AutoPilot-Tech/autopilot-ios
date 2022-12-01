//
//  ArcModeOverview.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/1/22.
//

import SwiftUI

struct ArcModeOverview: View {
    // Sample data
    let exercisesSet1 = ["Squat", "Step Up", "Burpee", "Sun salute"]
    let exercisesSet2 = ["Squat", "Step Up", "Burpee", "Sun salute"]

    let exercisesSet3 = ["Squat", "Step Up", "Burpee", "Sun salute"]
    let exercisesSet4 = ["Squat", "Step Up", "Burpee", "Sun salute"]

    var body: some View {
        VStack {
            Text("Workout Overview")
                .font(.title)
                .padding()
            Form {
                Section(
                    header:
                        Text("Core Exercise Block 1").font(.headline)
                ) {
                    
                }
                Section(
                    header:
                        Text("Core Exercise Block 2").font(.headline)
                ) {
                    
                }
                
                Section(
                    header:
                        Text("Accessory 1").font(.headline)
                ) {
                    
                }
                
                Section(
                    header:
                        Text("Accessory 2").font(.headline)
                ) {
                    
                }
            }
        }
    }
}

struct ArcModeOverview_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeOverview()
    }
}
