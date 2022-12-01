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
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @Binding var slideTabShowing: Bool
    @State private var showingAlert = false
//    @State private var sh
    
    var body: some View {
        ZStack {
            Text("Video Player")

            VStack {
                HStack {
                    Button(action: {
                        // ask if they are sure they want to do this
                        showingAlert = true
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
                .alert("Quit workout? Your progress will not be saved.", isPresented: $showingAlert) {
                    Button("Quit", role: .destructive) {
                        autopilotViewRouter.currentPage = .home
                        self.slideTabShowing = true
                    }
                }

                
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
        ArcModeView(autopilotViewRouter: AutopilotViewRouter(), slideTabShowing: .constant(false))
    }
}
