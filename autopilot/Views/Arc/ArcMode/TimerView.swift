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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

        var body: some View {
            HStack {
                Button(action: {
//                    showingAlert.toggle()
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 14, height: 14)
                        
                        
                }
                .frame(width: 26, height: 26)
                .background(.gray)
                .clipShape(Circle())
                .opacity(workoutIsPaused ? 1 : 0) // modify this.
                Spacer()
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
                Spacer()
                Button(action: {
                    timerIsRunning.toggle()
                    workoutIsPaused.toggle()
                }) {
                    Image(systemName: workoutIsPaused ? "play.circle.fill" : "pause.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.gray)
                        .symbolRenderingMode(.multicolor)
                    
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
        TimerView(timerIsRunning: .constant(true), workoutIsPaused: .constant(true))
    }
}
