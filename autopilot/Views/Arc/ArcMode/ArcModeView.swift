//
//  ArcMode.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct ArcModeView: View {
//    @EnvironmentObject var workoutOverview: OverviewStore
    @State private var showingOverview = false
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @Binding var slideTabShowing: Bool
    @State private var showingAlert = false
    @State private var showingPopup = false
    @State var timerValue: String = "0:00"
    let interval: TimeInterval = 0
    @State private var selectedTab = 0
    
//    @State private var sh
    
    var body: some View {
        ZStack(alignment: .top) {
           
            

            VStack {
                
                TabView(selection: $selectedTab) {
                    ForEach(0 ..< Exercise.exercises.count) { index in
                        ExerciseView(selectedTab: $selectedTab, autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing, index: index)
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height * 0.30)
            }
          
            
            

            
            VStack {
                SlideOverCard {
                    VStack {
                        Handle()
                        HStack {
                            ZStack {
                                ProgressView("0:00", value: 50, total: 100)
                                
                            }
                            
                                
    
                        }
                        .padding()
                        
                        HStack(spacing: 50) {
                            Button(action: {
                                showingPopup = true
                            }) {
                                Image(systemName: "dumbbell")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                                    .frame(width: 20, height: 20)
                                    
                                    
                            }
                            .frame(width: 32, height: 32)
                            .background(.gray)
                            .clipShape(Circle())
                                
                            Button(action: {
                                showingPopup = true
                            }) {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            .foregroundColor(.gray)
                            
                                
                            
                                
                            Button(action: {
                                showingOverview = true
                            }) {
                                Image(systemName: "list.bullet.circle.fill")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            .foregroundColor(.gray)
                            .sheet(isPresented: $showingOverview) {
                                ArcModeOverview()
                            }
                            
                            Button(action: {
                                selectedTab += 1
                            }) {
                                Image(systemName: "chevron.right.circle.fill")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            .foregroundColor(.green)
                            

                        }
                        .padding()
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
//            .navigationTitle(timerValue)
//            .navigationBarTitleDisplayMode(.inline)
            
        }
        .popup(isPresented: $showingPopup) {
            ZStack {
                Color.blue.frame(width: 200, height: 100)
                Text("Hi!")
            }
        }
    }
}

struct ArcModeView_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeView(autopilotViewRouter: AutopilotViewRouter(), slideTabShowing: .constant(false))
    }
}

