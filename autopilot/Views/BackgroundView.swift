//
//  BackgroundView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct BackgroundView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Color.white
                    .ignoresSafeArea()
                Circle()
                    .fill(.black.opacity(0.5))
                    .blur(radius: 10)
                    .offset(x:animate ? 10 : 130,y:animate ? 20 : 160)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
                    .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: true))
                // try changing this one after it animates
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .blur(radius: 20)
                    .offset(x: animate ? -120 : 10,y :animate ? -100 : 20)
                    .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
                    .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: true))
                Rectangle()
                    .fill(.red)
                    .blur(radius: 30)
                    .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
                    .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
                    .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: true))
                Capsule()
                    .fill(.blue.opacity(0.3))
                    .blur(radius: 40)
                    .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
                    .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
                Circle()
                    .fill(.blue)
                    .blur(radius: 50)
                    .offset(x: animate ? 90 : -10,y:animate ? -90 : 40)
                    .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
                    .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: true))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .blur(radius: 60)
                    .offset(x: animate ? -90 : 40,y:animate ? 90 : -20)
                    .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
                    .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: true))
                Capsule()
                    .fill(.white)
                    .blur(radius: 70)
                    .offset(x: animate ? 10 : 170 ,y:animate ? 0 : -150)
                    .opacity(0.4)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                    
                
                
            }.frame(width: UIScreen.main.bounds.width-100,height: UIScreen.main.bounds.height+100)
                .onAppear() {
                    animate.toggle()
                }
                
                
            
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
