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
                    ForEach(exercisesSet1, id: \.self) {
                        exercise in Text(exercise)
                    }
                    
                }
                Section(
                    header:
                        Text("Core Exercise Block 2").font(.headline)
                ) {
                    ForEach(exercisesSet2, id: \.self) {
                        exercise in Text(exercise)
                    }
                }
                
                Section(
                    header:
                        Text("Accessory 1").font(.headline)
                ) {
                    ForEach(exercisesSet3, id: \.self) {
                        exercise in Text(exercise)
                    }
                }
                
                Section(
                    header:
                        Text("Accessory 2").font(.headline)
                ) {
                    ForEach(exercisesSet4, id: \.self) {
                        exercise in Text(exercise)
                    }
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
