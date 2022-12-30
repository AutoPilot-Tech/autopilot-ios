//
//  TimerView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/2/22.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining = 0
    @Binding var timerIsRunning: Bool
    @Binding var workoutIsPaused: Bool
    @Binding var routineStatus: RoutineStatus
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

        var body: some View {
            VStack {
                HStack {
                    Button(action: {
    //                    showingAlert.toggle()
                    }) {
                        Image(systemName: routineStatus == .paused ? "xmark" : routineStatus == .running ? "xmark" : routineStatus == .notrunning ? "xmark" : routineStatus == .loading ? "xmark" : "xmark")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 14, height: 14)
                            .opacity(routineStatus == .notrunning ? 0 : routineStatus == .loading ? 0 : routineStatus == .running ? 0 : 1)
                            
                            
                    }
                    .frame(width: 26, height: 26)
                    .background(.gray)
                    .clipShape(Circle())
                    .opacity(workoutIsPaused ? 1 : 0) // modify this.
                    Spacer()
                    switch routineStatus {
                    case .notrunning:
                        Text("48 MIN")
                            .foregroundColor(.white)
                            .font(.headline)
                    default:
                    Text("\(timeString(time: timeRemaining))")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .onReceive(timer) { _ in
                            if timerIsRunning {
                                if timeRemaining >= 0 {
                                    timeRemaining += 1
                                }
                            }
                            
                    }
                    }
                    
                    Spacer()
                    
                    
                    Button(action: {
                        timerIsRunning.toggle()
                        workoutIsPaused.toggle()
                        
                        switch routineStatus {
                        case .running:
                            routineStatus = .paused
                        case .paused:
                            routineStatus = .running
                        default:
                            routineStatus = .error
                            }
                        
                    }) {
                        Image(systemName: routineStatus == .paused ? "play.circle.fill" : routineStatus == .running ? "pause.circle.fill" : routineStatus == .notrunning ? "play.circle.fill" : routineStatus == .loading ? "play.circle.fill" : "play.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 26, height: 26)
                            .foregroundColor(.gray)
                            .symbolRenderingMode(.multicolor)
                            .opacity(routineStatus == .notrunning ? 0 : routineStatus == .loading ? 0 : 1)
                        
                    }
                    .overlay(
                        Button(action: {
    //                        timerIsRunning.toggle()
    //                        workoutIsPaused.toggle()
                        }) {
                            Image(systemName: "gearshape.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 26, height: 26)
                                .foregroundColor(.gray)
                                .symbolRenderingMode(.multicolor)
                            
                        }
                            .opacity(routineStatus == .paused ? 1 : 0)
                            .offset(x: -50)
                        
                    )
                    
                }
                HStack {
                    switch routineStatus {
                    case .notrunning:
                        Text("")
                    default:
                        Spacer()
                        Text("46 MIN LEFT")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                }
                
            }
            
        }
    
    func timeString(time: Int) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time)
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerIsRunning: .constant(true), workoutIsPaused: .constant(true), routineStatus: .constant(.notrunning))
    }
}
