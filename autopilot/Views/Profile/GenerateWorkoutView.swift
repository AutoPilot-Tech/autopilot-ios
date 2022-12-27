//
//  GenerateWorkoutView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/2/22.
//

import SwiftUI

struct GenerateWorkoutView: View {
    // Add a state variable for each section of the form
    @State private var workoutName = ""
    @State private var workoutDescription = ""
    @State private var coreExerciseBlock1 = ""
    @State private var coreExerciseBlock2 = ""
    @State private var secondaryBlock1 = ""
    @State private var accessoryBlock1 = ""
    @State private var accessoryBlock2 = ""
    
    // Add a state variable for the rest incrementer
    @State private var restIncrementer1 = 30
    @State private var restIncrementer2 = 30
    @State private var restIncrementer3 = 30
    @State private var restIncrementer4 = 30
    @State private var restIncrementer5 = 30





    
    @State private var targetUserOptions = ["Rachael Beard", "Matthew Molinar", "Caleb Ford"]
    
    @State private var date = Date()
    
    let dayOptions = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    // Create an array of exercises for the dropdown pickers
    let exercises = ["Exercise 1", "Exercise 2", "Exercise 3", "Exercise 4"]
    
    var body: some View {
        Form {
            // Workout name and description section
            Section(header: Text("Workout name and description")) {
                TextField("Workout name", text: $workoutName)
                TextField("Workout description", text: $workoutDescription)
            }
            
            Section(header: Text("Who is this workout for?")) {
                Picker("Pick a User", selection: $targetUserOptions) {
                    ForEach(targetUserOptions, id: \.self) { user in
                        Text(user)
                        
                    }
                }
            }
            
            Section(header: Text("What day is this for?")) {
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            
            // Core Exercise Block 1 section
            Section(header: Text("Core Exercise Block 1")) {
                Picker("Exercise", selection: $coreExerciseBlock1) {
                    ForEach(exercises, id: \.self) { exercise in
                        Text(exercise)
                    }
                }
                Stepper("Rest between sets: \(restIncrementer1)s", value: $restIncrementer1, in: 30...300, step: 5)
                
            }
            
            // Core Exercise Block 2 section
            Section(header: Text("Core Exercise Block 2")) {
                Picker("Exercise", selection: $coreExerciseBlock2) {
                    ForEach(exercises, id: \.self) { exercise in
                        Text(exercise)
                    }
                }
                Stepper("Rest between sets: \(restIncrementer2)s", value: $restIncrementer2, in: 30...300, step: 5)
            }
            
            // Secondary Block 1 section
            Section(header: Text("Secondary Block 1")) {
                Picker("Exercise", selection: $secondaryBlock1) {
                    ForEach(exercises, id: \.self) { exercise in
                        Text(exercise)
                    }
                }
                Stepper("Rest between sets: \(restIncrementer3)s", value: $restIncrementer3, in: 30...300, step: 5)
            }
            
            // Accessory Block 1 section
            Section(header: Text("Accessory Block 1")) {
                Picker("Exercise", selection: $accessoryBlock1) {
                    ForEach(exercises, id: \.self) { exercise in
                        Text(exercise)
                    }
                }
                Stepper("Rest between sets: \(restIncrementer4)s", value: $restIncrementer4, in: 30...300, step: 5)
            }
            
            // Accessory Block 2 section
            Section(header: Text("Accessory Block 2")) {
                Picker("Exercise", selection: $accessoryBlock2) {
                    ForEach(exercises, id: \.self) { exercise in
                        Text(exercise)
                    }
                }
                Stepper("Rest between sets: \(restIncrementer5)s", value: $restIncrementer5, in: 30...300, step: 5)
            }
        }
    }
}

struct GenerateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateWorkoutView()
    }
}
