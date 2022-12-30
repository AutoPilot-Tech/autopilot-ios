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
    @Binding var workoutIsPaused: Bool
    @Binding var indexForExercises: Int
    @Binding var timerIsRunning: Bool
    @State private var playbackPosition = 0.0
    @State private var playbackEnded = false
   
    let index: Int
    let totalTime:TimeInterval = 0
    
    var body: some View {

        ZStack {
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
            
            
                VStack {
                    if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                        let player = AVPlayer(url: url)
                            
                        VideoPlayer(player: player)
                            .disabled(true)
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
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), autopilotViewRouter: AutopilotViewRouter(), slideTabShowing: .constant(false), workoutIsPaused: .constant(false), indexForExercises: .constant(0), timerIsRunning: .constant(true), index: 0)
    }
}
