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
                    // Conditional on what to show
                    // CollectionViewCards
                    // Profile
                    SlideOverCard {
                        VStack {
                            // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                            Handle()
                            SearchBar(text: $searchText)
                            // Tab Bar here
                            HStack {
                                    VStack {
                                        Image(systemName: "person.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                            .padding(.top, 10)
                                        
                                        Text("Profile")
                                            .font(.footnote)
                                    }
                                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                                         .background(Color("TabBarBackground").shadow(radius: 2))
                                
                                Spacer()
                                
                                
                                
                                
                            }
                            
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
    
    
