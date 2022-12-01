//
//  ArcModeDetailView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct ArcModeDetailView: View {
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @Binding var slideTabShowing: Bool
    @State var searchText = ""

    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Button(action: {
                        self.slideTabShowing = true
                        autopilotViewRouter.currentPage = .home
                    }) {
                        Image(systemName: "x.square.fill")
                            .foregroundColor(.red)
                    }
                    .padding(.horizontal, 25)
                    Spacer()
                }
                
                Spacer()
                VStack {
                    Text("35 minutes")
                    Spacer()
                    VStack(spacing: 10) {
                        Text("Day 1")
                        Text("Back/Biceps")
                    }
                    Spacer()
                    Button(action: {} ) {
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
            
                
            
        }
    }
}

struct ArcModeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeDetailView(autopilotViewRouter: AutopilotViewRouter(), slideTabShowing: .constant(false))
    }
}
