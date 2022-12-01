//
//  ArcModeDetailView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct ArcModeDetailView: View {
    @State var searchText = ""

    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Workout Arc Made For You")
                    Text("Back/Biceps")
                }
                
                NavigationLink(destination: ArcModeView()) {
                    Image(systemName: "play.fill")
                        .frame(width: 64, height: 64)
                        .background(.blue)
                        .clipShape(Circle())
                    .foregroundColor(.white)
                }
            }
            
                
            SlideOverCard {
                ZStack(alignment: .topTrailing) {
                    
                    GeometryReader { geometry in
                        VStack {
                            
                            // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                            Handle()
                            SearchBar(text: $searchText, placeholder: "What do you want to do?")
                            // Tab Bar here
                            ScrollView {
                                HStack {
                                    
                                    HStack {
                                        Text("Recommended")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        .padding()
                                        BetaTag()
                                        
                                    }
                                    Spacer()
                                    
                                }
                                    

                                HStack {
                                    NavigationLink(destination: GodView()) {
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
                                    
                                    
                                    NavigationLink(destination: ContentView()) {
                                        VStack {
                                            Image(systemName: "heart.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                .symbolRenderingMode(.multicolor)
                                            
                                            Text("For You")
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
                                    
                                    Text("Shortcuts")
                                        .padding()
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    
                                }
                                .padding(.top, -65)
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

struct ArcModeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeDetailView()
    }
}
