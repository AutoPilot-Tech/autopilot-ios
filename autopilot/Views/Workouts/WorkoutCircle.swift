//
//  WorkoutCircle.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI

struct WorkoutCircle: View {
  @Binding var completed: Bool

  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(.gray)

      if completed {
        Text("\u{f00c}") // checkmark icon from SwiftUI Fonts
          .font(.title)
          .foregroundColor(.green)
      }
    }
  }
}
