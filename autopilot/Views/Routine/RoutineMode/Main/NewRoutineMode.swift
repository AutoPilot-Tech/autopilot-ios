//
//  NewRoutineMode.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/30/22.
//

import SwiftUI
import AVKit

struct NewRoutineMode: View {
    @State var timerIsRunning = false
    @State var workoutIsPaused = false
    @State var routineStatus: RoutineStatus = .notrunning
    @ObservedObject var viewModel: Routine
    @State private var bottomSheetOffset: CGFloat = 1000
    @State private var playButtonOffset: CGFloat = -60
    @ObservedObject var viewRouter: AutopilotViewRouter

    
    var body: some View {
        VStack(spacing: 0) {
            if let url = Bundle.main.url(forResource: "step-up", withExtension: "mp4") {
                let player = AVPlayer(url: url)

                VideoPlayer(player: player)
                    .edgesIgnoringSafeArea(.all)
                    .disabled(true)
                    .onAppear {
                        player.play()
                        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                            player.seek(to: .zero)
                            player.play()
                        }
                    }
                    .overlay {
                        VStack {
                            Text(viewModel.routineName)
                                .font(Font.system(size: 20))
                                .bold()
                                .opacity(routineStatus == .notrunning ? 1 : 0)
                            Text(viewModel.routineCaption)
                                .font(Font.system(size: 40))
                                .bold()
                                .opacity(routineStatus == .notrunning ? 1 : 0)
                        }
                        .foregroundColor(.white)
                    }
    

     
            } else {
                Text("Couldn't find .mp4").foregroundColor(.red)
            }
           
           HStack {
               Button(action: {}) {
                   Image(systemName: "list.bullet")
                       .resizable()
                       .scaledToFill()
                       .frame(width: 24, height: 24)
                   .foregroundColor(Color(.systemGray))
               }
               Spacer()
               Button(action: {
                   self.routineStatus = .running
                   self.bottomSheetOffset = 140
                   self.playButtonOffset = 0
               }) {
                   VStack {
                       Spacer()
                       Image(systemName: "play.fill")
                           .resizable()
                           .scaledToFill()
                           .foregroundColor(.white)
                           .frame(width: 14, height: 14)
                       Text("START")
                           .foregroundColor(.white)
                           .font(Font.system(size: 14))
                           .padding(.top, 2)
                           
                       Spacer()
                        
                   }
               }
               .frame(width: 90, height: 90)
               .background(.blue)
               .clipShape(Circle())
               .offset(y: self.playButtonOffset)
               .animation(.spring())

               Spacer()
               Image(systemName: "list.bullet")
                   .resizable()
                   .scaledToFill()
                   .frame(width: 24, height: 24)
                   .foregroundColor(Color(.systemGray6))
                   .opacity(0)
           }
           
           .frame(height: 120)
           .padding(.horizontal, 70)
           .background(Color(.systemGray6))
           .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 5)
           
               
           
        }
        .overlay(alignment: .top) {
            BlackGradient()
                .frame(width: UIScreen.main.bounds.width, height: 300)
        }
       .overlay(alignment: .top) {
           TimerView(timerIsRunning: $timerIsRunning, workoutIsPaused: $workoutIsPaused, routineStatus: $routineStatus, timerValue: viewModel.timerValue, autopilotViewRouter: viewRouter )
               .padding(.horizontal)
       }
       .overlay(alignment: .bottom) {
           RoutineBottomSheet()
               .offset(y: bottomSheetOffset)
               .animation(.spring())

       }
        
    }
}

struct NewRoutineMode_Previews: PreviewProvider {
    static var previews: some View {
        NewRoutineMode(viewModel: Routine(), viewRouter: AutopilotViewRouter())
    }
}
