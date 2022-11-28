//
//  ContentView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI


struct ContentView : View {
    @State var searchText = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment.top) {
                BackgroundView()
                    .ignoresSafeArea()
                VStack {
                    
                }
                    // Conditional on what to show
                    // CollectionViewCards
                    // Profile
//                ChatView()
                // TODO: Send the height needed for tab bar, then add to current height
                    SlideOverCard {
                        VStack {
                            // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                            Handle()
                            SearchBar(text: $searchText)
                            // Tab Bar here
                            HStack {
                                VStack {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                        .symbolRenderingMode(.multicolor)
                                        .foregroundColor(.blue)
                                    
                                    Text("Profile")
                                        .font(.footnote)
                                }
                                .padding(.horizontal, -4)
                                
                                VStack {
                                    Image(systemName: "heart.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                        .symbolRenderingMode(.multicolor)
                                    
                                    Text("For you")
                                        .font(.footnote)
                                }
                                .padding(.horizontal, -4)
                                
                                VStack {
                                    Image(systemName: "bubble.left.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                        .symbolRenderingMode(.multicolor)
                                        .foregroundColor(.green)
                                    
                                    Text("Chat")
                                        .font(.footnote)
                                }
                                .padding(.horizontal, -4)
                                
                                
                                
                                    
                                         
                                
                                Spacer()
                                
                                
                                
                                
                            }
                            .padding(.top, -20.0)
                            .frame(width: geometry.size.width, height: geometry.size.height/8)
                            // not working for some reason
                            .background(Color("TabBarBackground").shadow(radius: 2))
                            
                            
                            Spacer()
                        }
                    }
                }
            .edgesIgnoringSafeArea(.vertical)
        }
        
        
    }
}
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    

