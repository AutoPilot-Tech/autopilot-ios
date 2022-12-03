//
//  TimerView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/2/22.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining = 0
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

        var body: some View {
            Text("\(timeString(time: timeRemaining))")
                .onReceive(timer) { _ in
                    if timeRemaining >= 0 {
                        timeRemaining += 1
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
        TimerView()
    }
}
