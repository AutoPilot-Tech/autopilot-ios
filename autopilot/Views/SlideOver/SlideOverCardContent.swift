//
//  SlideOverCardContent.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

struct SlideOverCardContent: View {
    
    @State var searchText = ""
    var body: some View {
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
                                
                                
                                NavigationLink(destination: ContentView(autopilotViewRouter: AutopilotViewRouter.shared)) {
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
        }    }
}

struct SlideOverCardContent_Previews: PreviewProvider {
    static var previews: some View {
        SlideOverCardContent()
    }
}
