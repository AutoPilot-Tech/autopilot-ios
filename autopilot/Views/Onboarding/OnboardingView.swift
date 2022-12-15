//
//  OnboardingView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/14/22.
//

import SwiftUI

struct OnboardingView: View {
  @State private var wakeUpTime = Date()
  @State private var sleepTime = Date()
  @State private var dailyExerciseMinutes = 0
  @State private var dailyWaterIntake = 0
  @State private var dailyFruitIntake = 0

  var body: some View {
    Form {
      Section(header: Text("Wake-up Time")) {
        DatePicker("Please enter your wake-up time:", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
          .labelsHidden()
          .animation(.easeInOut)
      }

      Section(header: Text("Bedtime")) {
        DatePicker("Please enter your bedtime:", selection: $sleepTime, displayedComponents: .hourAndMinute)
          .labelsHidden()
          .animation(.easeInOut)
      }

      Section(header: Text("Daily Exercise (minutes)")) {
        Stepper(value: $dailyExerciseMinutes, in: 0...180) {
          Text("\(dailyExerciseMinutes) minutes")
        }
      }

      Section(header: Text("Daily Water Intake (cups)")) {
        Stepper(value: $dailyWaterIntake, in: 0...10) {
          Text("\(dailyWaterIntake) cups")
        }
      }

      Section(header: Text("Daily Fruit Intake (servings)")) {
        Stepper(value: $dailyFruitIntake, in: 0...5) {
          Text("\(dailyFruitIntake) servings")
        }
      }

      Button(action: {
        // Save the user's habits to persistent storage.
      }) {
        Text("Save")
      }
    }
    .animation(.spring())
  }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
