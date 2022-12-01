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
   
    let index: Int
    let totalTime:TimeInterval = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack {
                    
                    Text(Date().addingTimeInterval(totalTime), style: .timer)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        
                    Text(Exercise.exercises[index].exerciseName)
                        .foregroundColor(.white)

                    Spacer()
                    
                    if let url = Bundle.main.url(forResource: "squat", withExtension: "mp4") {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: geometry.size.height * 0.45)
                            .padding(.bottom, geometry.size.height * 0.30)
                    } else {
                        Text("Couldn't find \(Exercise.exercises[index].videoName).mp4").foregroundColor(.red)
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), index: 0)
    }
}
