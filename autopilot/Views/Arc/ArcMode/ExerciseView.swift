//
//  ExerciseView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/1/22.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack {
                    
                    Text("Timer")
                        .foregroundColor(.white)
                        
                    Text(exerciseNames[index])
                        .foregroundColor(.white)

                    Spacer()
                    
                    if let url = Bundle.main.url(forResource: "squat", withExtension: "mp4") {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: geometry.size.height * 0.45)
                            .padding(.bottom, geometry.size.height * 0.30)
                    } else {
                        Text("Couldn't find \(videoNames[index]).mp4").foregroundColor(.red)
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0)
    }
}
