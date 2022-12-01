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
    
//    @State private var sh
    
    var body: some View {
        ZStack {
            VStack {
//                Text("Timer")
//                    .padding(.top, UIScreen.main.bounds.height * 0.12)
                TabView {
                    ForEach(0 ..< 4) { index in
                        ExerciseView(index: index)
                            .padding(.top, UIScreen.main.bounds.height * 0.12)
                    }
                
                }
                


                Spacer()

                Text("Video Player")
                Spacer()
            }
          
            
            

            
            VStack {
                SlideOverCard {
                    VStack {
                        Handle()
                        HStack {
                            ZStack {
                                ProgressView("Activity Name", value: 50, total: 100)
                                
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
                            
                            Button(action: {}) {
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
            .navigationBarItems( leading: Button(action: {
                showingAlert = true
            }) {
                Image(systemName: "x.square.fill")
                    .foregroundColor(.red)
            } )
            .alert("Are you sure you want to quit this workout?", isPresented: $showingAlert) {
                Button("Quit", role: .destructive) {
                    self.slideTabShowing = true
                    autopilotViewRouter.currentPage = .home
                }
            }
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

