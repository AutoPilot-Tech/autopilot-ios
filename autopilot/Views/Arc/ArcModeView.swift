//
//  ArcMode.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct ArcModeView: View {
    
    var body: some View {
        ZStack {
            Text("Arc Mode")
            SlideOverCard {
                ZStack(alignment: .topTrailing) {
                    
                    GeometryReader { geometry in
                        VStack {
                            
                            // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                            Handle()
                            
                            // Tab Bar here
                            ScrollView {
                                HStack {
                                    
                                    HStack {
                                        Text("Recommended")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .frame(width: 115)
                                        .padding()
                                        BetaTag()
                                        
                                    }
                                    Spacer()
                                    
                                }
                                    

                                HStack {
                                    NavigationLink(destination: FreeFlowArcMode()) {
                                        VStack {
                                            Image(systemName: "play.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                .symbolRenderingMode(.multicolor)
                                                .foregroundColor(.blue)
                                            
                                            Text("Focus")
                                                .font(.footnote)
                                        }
                                        .padding(.horizontal, -4)
                                    }
                                    
                                    
                                    NavigationLink(destination: GodView()) {
                                        VStack {
                                            Image(systemName: "magnifyingglass.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                .symbolRenderingMode(.multicolor)
                                                .foregroundColor(.pink)
                                            
                                            Text("Explore")
                                                .font(.footnote)
                                        }
                                        .padding(.horizontal, -4)
                                    }
                                    
                                    NavigationLink(destination: GodView()) {
                                        VStack {
                                            Image(systemName: "bubble.left.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                .symbolRenderingMode(.multicolor)
                                                .foregroundColor(.green)
                                            
                                            Text("Your Coach")
                                                .font(.footnote)
                                        }
                                        .padding(.horizontal, -4)
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                        
                                             
                                    
                                    Spacer()
                                    
                                    
                                    
                                    
                                }
                                .padding(.top, -60.0)
                                .frame(width: geometry.size.width, height: geometry.size.height/8)
                                HStack {
                                    
                                    HStack {
                                        Text("Shortcuts")
                                            .frame(width: 115)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        ComingSoon()
                                        
                                    }
                                    Spacer()
                                    
                                }
                                .padding(.top, -50)
                                NavigationLink(destination: GodView()) {
                                    VStack {
                                        Image(systemName: "magnifyingglass.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                            .symbolRenderingMode(.multicolor)
                                            .foregroundColor(.pink)
                                        
                                        Text("Explore")
                                            .font(.footnote)
                                    }
                                    .padding(.horizontal, -4)
                                }
                                Spacer()
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct ArcModeView_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeView()
    }
}
