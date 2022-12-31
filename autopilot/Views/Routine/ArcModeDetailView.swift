//
//  ArcModeDetailView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct ArcModeDetailView: View {
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @State var searchText = ""

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                
                
                Spacer()
                VStack {
                    Text("35 minutes")
                    Spacer()
                    VStack(spacing: 10) {
                        Text("Day 1")
                        Text("Back/Biceps")
                    }
                    Spacer()
                    Button(action: {
                        autopilotViewRouter.currentPage = .arcMode
                        autopilotViewRouter.slideTabShowing = false
                    } ) {
                        VStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                            Text("Start")
                                .foregroundColor(.white)
                                
                        }
                        
                    }
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .clipShape(Circle())
                    
                    Spacer()
                    VStack(spacing: 10) {
                        Text("What you need:")
                        Text("Bench, dumbbell")

                    }
                        .padding(.top, 100)
                    Spacer()
                }
                
                
            }
            
                
            .navigationBarItems( leading: Button(action: {
                autopilotViewRouter.slideTabShowing = true
                autopilotViewRouter.currentPage = .home
            }) {
                Image(systemName: "x.square.fill")
                    .foregroundColor(.red)
            } )
        }
    }
}

struct ArcModeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeDetailView(autopilotViewRouter: AutopilotViewRouter())
    }
}
