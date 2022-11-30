//
//  MadeForYou.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//
import SwiftUI

struct MadeForYou: View {
    @State private var animate = false
    // TODO: make the animation only witin this views bounds
    var body: some View {
        VStack {
            GeometryReader { geo in
                Spacer()

            ZStack {
                    Circle()
                        .fill(.blue)
                        .blur(radius: 10)
                        .offset(x:animate ? 10 : 130,y:animate ? 20 : 160)
                        .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .blur(radius: 20)
                        .offset(x: animate ? -120 : 10,y :animate ? -100 : 20)
                        .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                    Rectangle()
                        .fill(.blue)
                        .blur(radius: 30)
                        .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
                        .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                    Capsule()
                        .fill(.mint)
                        .blur(radius: 40)
                        .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
                        .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                    Circle()
                        .fill(.blue)
                        .blur(radius: 50)
                        .offset(x: animate ? 90 : -10,y:animate ? -90 : 40)
                        .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.teal)
                        .blur(radius: 60)
                        .offset(x: animate ? -90 : 40,y:animate ? 90 : -20)
                        .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                    Capsule()
                        .fill(.black)
                        .blur(radius: 70)
                        .offset(x: animate ? 10 : 170 ,y:animate ? 0 : -150)
                        .opacity(0.4)
                        .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                    
                    VStack() {
                        HStack {
                            VStack(alignment:.leading,spacing:15) {
                                Text("Today's Workout")
                                    .bold()
                                    .font(.system(size: 40, weight: .heavy))
                                Text("Back/Bicep")
                                    .font(.system(size: 40, weight: .regular)).padding(.vertical,-25)
                            }
                            Spacer()
                        }.padding().padding()
                        Spacer()
                        Text("Workout Made For You")
                            .font(.system(size: 14))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .multilineTextAlignment(.center)
                    }.foregroundColor(.white)
                    
                }.frame(width: geo.size.width,height: geo.size.height)
                    .clipped()
                }
                
                
            
        }
    }
}
