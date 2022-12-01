//
//  ArcCardContent.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct ArcCardContent: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Color.white.opacity(0.7)
//                    BackgroundView()
                        .frame(width: geo.size.width, height: geo.size.height * 0.85)
                        
                    VStack {
                        Text("Morning Routine")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Text("35 min")
                            .foregroundColor(.white)
                        Button(action: {}) {
                            Image(systemName: "play.fill")
                                .frame(width: 64, height: 64)

                        }
                        .background(.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                    
                    
                }
                VStack {
                    HStack {
                        Text("Workout")
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "list.bullet")
                        }
                    }.padding()
                    Spacer()
                    
                }
            }
        }
    }
}

struct ArcCardContent_Previews: PreviewProvider {
    static var previews: some View {
        ArcCardContent()
    }
}
