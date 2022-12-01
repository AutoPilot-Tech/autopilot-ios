//
//  ArcMode.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct ArcModeView: View {
//    @EnvironmentObject var workoutOverview: OverviewStore
    @State private var showOverview = false
//    @State private var sh
    
    var body: some View {
        ZStack {
            Text("Video Player")

            VStack {
                HStack {
                    Button(action: {
                        // Go back home
                    }) {
                        Image(systemName: "x.square.fill")
                    }
                    .padding(.horizontal)
                    Spacer()
                    Text("Timer")
                    Spacer()
                }
                .padding(.top, UIScreen.main.bounds.height * 0.12)

                
                Spacer()
            }
            
            SlideOverCard {
                VStack {
                    Handle()
                    ProgressView("Activity Name", value: 50, total: 100)
                    HStack {
                        Text("Weight")
                        Text("Reps")

                        Text("Overview")
                        
                        Text("Next")

                    }
                    Spacer()
                }
            }
        }
    }
}

struct ArcModeView_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeView()
    }
}
