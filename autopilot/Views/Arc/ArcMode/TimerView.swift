//
//  TimerView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/2/22.
//

import SwiftUI

struct TimerView: View {
    @State private var currentTime = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        // new timer view
        Text("\(currentTime)")
            .font(.system(size: 45, design: .rounded))
            .padding()
            .onReceive(timer) { _ in
                if self.currentTime > 0 {
                    self.currentTime += 1
                }
                
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
