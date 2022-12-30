//
//  IndividualTaskView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/30/22.
//

import SwiftUI

// TODO: This view would show a routine, but in a small format, like a task. User can not delete it, can either PLAY, or see OVERVIEW.

// TODO: The way this looks would literally be the same for Schedule View.

// TODO: When the user clicks this - it expands into a RoutineModeView that has a RoutineStatus of .notrunning

// TODO: If that is the case, we would need an AutoPilotNavigator to store state of where the user was in the app. Fuck SwiftUI navigator

struct IndividualTaskView: View {
    var body: some View {
        VStack {
            Text("Video Player")
            HStack {
                Text("Overview")
                Text("Play")
                Text("Elipses")
            }
        }
    }
}

struct IndividualTaskView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualTaskView()
    }
}
