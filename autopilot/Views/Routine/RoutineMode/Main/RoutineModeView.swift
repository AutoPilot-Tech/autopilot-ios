//
//  ArcMode.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI
import AVKit

struct RoutineModeView: View {
//    @EnvironmentObject var workoutOverview: OverviewStore
    @State private var showingOverview = false
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @Binding var slideTabShowing: Bool
    @State private var showingAlert = false
    @State private var showingPopup = false
    @State var timerValue: String = "0:00"
    let interval: TimeInterval = 0
    @State private var selectedTab = 0
    @State var lastExercise = false
    @State var indexForExercises = 0
    @State var timerIsRunning = true
    @State var workoutIsPaused = false
    
    var progressInterval: ClosedRange<Date> {
        let start = Date()
        let end = start.addingTimeInterval(TimeInterval(Exercise.exercises[indexForExercises].duration))
        return start...end
    }
    
    
    var body: some View {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(0 ..< Exercise.exercises.count) { index in
                        VStack {
                            if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                                let player = AVPlayer(url: url)
                                    
                                VideoPlayer(player: player)
                                    .edgesIgnoringSafeArea(.all)
                                    .disabled(true)
                                    .offset(y: -100)
                                    .onAppear {
                                        player.play()
                                        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                                            player.seek(to: .zero)
                                            player.play()
                                        }
                                    }
                    

                     
                            } else {
                                Text("Couldn't find \(Exercise.exercises[index].videoName).mp4").foregroundColor(.red)
                            }
                        }
                        
                    }
                }
                
                
            }
            .overlay(
              BlackGradient()
            )
            .overlay {
                if workoutIsPaused {
                    Text("Workout Paused")
                        .zIndex(2)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    Rectangle()
                        .zIndex(1)
                        .background(.black)
                        .opacity(0.4)
                    
                }
            }
            .overlay(alignment: .top) {
//                TimerView(timerIsRunning: $timerIsRunning, workoutIsPaused: $workoutIsPaused)
//                    .padding(.horizontal)
                Text("48 MIN")
            }
            
            

            .overlay {
                SlideOverCard {
                    VStack {
                        Handle()
                        Text(Exercise.exercises[indexForExercises].exerciseName)
                            .font(.title3)
                        .padding()
                        
                        HStack(spacing: 25) {
    
                            Button(action: {
                                showingOverview = true
                            }) {
                                Image(systemName: "list.bullet")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 10)
                            .sheet(isPresented: $showingOverview) {
                                ArcModeOverview()
                            }
                            if #available(iOS 16.0, *) {
                                ProgressView(timerInterval: progressInterval, countsDown: false)
                            } else {
                                // Fallback on earlier versions
                                ProgressView("Loading...", value: 50, total: 100)
                            }
                                    
              
                            Button(action: {
                                selectedTab += 1
                                indexForExercises += 1
                            }) {
                                Image(systemName: "chevron.forward.circle.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.green)
                            }
                            .frame(width: 38, height: 38)
                            .background(.white)
                            .clipShape(Circle())

                        }
                        .padding()
                        .padding(.vertical, 20)
                        Divider()

                        HStack {
                            ScrollView {
                                
                                VStack {
                                    Spacer()
                                    HStack(spacing: 20) {
                                        VStack {
                                            Button(action: {
                                                showingPopup = true
                                            }) {
                                                Image(systemName: "dumbbell")
                                                
                                            }
                                            Spacer()
                                            Text("Adjust")
                                            Text("Weight")
                                        }
                                        VStack {
                                            Button(action: {
                                                showingPopup = true
                                            }) {
                                                Image(systemName: "square.stack.3d.up.fill")
                                                
                                                
                                            }
                                            Spacer()
                                            Text("Report")
                                            Text("Reps")
                                        }
                                        VStack {
                                            Button(action: {
                                                
                                            }) {
                                                Image(systemName: "restart.circle.fill")
                                                
                                                
                                            }
                                            Spacer()
                                            Text("Restart")
                                            Text("Set")
                                        }
                                        VStack {
                                            Button(action: {
                                                showingPopup = true
                                            }) {
                                                Image(systemName: "info.circle.fill")
                                                
                                                
                                            }
                                            Spacer()
                                            Text("Read")
                                            Text("Guide")
                                        }
                                        VStack {
                                            Button(action: {}) {
                                                Image(systemName: "clock.fill")
                                                
                                            }
                                            Spacer()
                                            Text("Exercise")
                                            Text("History")
                                            
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .popup(isPresented: $showingPopup) {
                    ZStack {
                        Color.blue.frame(width: 200, height: 100)
                        Text("Hi!")
                    }
                }
                
            }
            
            
        
        
    }
}

struct RoutineModeView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineModeView(autopilotViewRouter: AutopilotViewRouter(), slideTabShowing: .constant(false))
    }
}





