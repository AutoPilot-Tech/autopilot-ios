//
//  ExerciseView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/1/22.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var showingAlert = false
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @Binding var slideTabShowing: Bool
    @State private var workoutPaused = false
    @Binding var indexForExercises: Int
    @Binding var timerIsRunning: Bool
   
    let index: Int
    let totalTime:TimeInterval = 0
    
    var body: some View {

        ZStack {
            if workoutPaused {
                Text("Workout Paused")
                    .zIndex(2)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Rectangle()
                    .zIndex(1)
                    .background(.black)
                    .opacity(0.4)
                
            }
            
            Color.black
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    ZStack {
                        if workoutPaused {
                            HStack {
                                Button(action: {
                                    showingAlert.toggle()
                                }) {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.white)
                                        .frame(width: 14, height: 14)
                                        
                                        
                                }
                                .frame(width: 32, height: 32)
                                .background(.gray)
                                .clipShape(Circle())
                                .padding()
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Quit workout?"), message: Text("Your progress won't be saved."), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Quit"), action: {
                                        slideTabShowing = true
                                        autopilotViewRouter.currentPage = .home
                                    }))
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 25)
                                Spacer()
                                Button(action: {
                                    timerIsRunning.toggle()
                                    workoutPaused.toggle()
                                }) {
                                    Image(systemName: "play.circle.fill")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.gray)
                                        .frame(width: 32, height: 32)
                                        .background(.white)
                                        .clipShape(Circle())
                                        
                                        
                                }
                                .zIndex(2)
                                .padding()
                                .padding(.bottom, 25)

                            }
                        } else {
                            HStack {
                                Spacer()
                                Button(action: {
                                    timerIsRunning.toggle()
                                    workoutPaused.toggle()
                                }) {
                                    Image(systemName: "pause.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.gray)
                                        .symbolRenderingMode(.multicolor)
                                    
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Quit workout?"), message: Text("Your progress won't be saved."), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Quit"), action: {
                                        slideTabShowing = true
                                        autopilotViewRouter.currentPage = .home
                                    }))
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 25)
                                
                                
                            }
                        }
                        
                        HStack {
                            Spacer()
                            VStack {
//                                Text(Date().addingTimeInterval(totalTime), style: .timer)
//                                    .font(.system(size: 40))
//                                .foregroundColor(.white)
//                                TimerView()
                                
//                                Text(Exercise.exercises[index].exerciseName)
//                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        
                    }
                    
                        
                    

                    Spacer()
                    
                    if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: geometry.size.height * 0.45)
                            .padding(.bottom, geometry.size.height * 0.30)
                    } else {
                        Text("Couldn't find \(Exercise.exercises[index].videoName).mp4").foregroundColor(.red)
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), autopilotViewRouter: AutopilotViewRouter(), slideTabShowing: .constant(false), indexForExercises: .constant(0), timerIsRunning: .constant(true), index: 0)
    }
}
