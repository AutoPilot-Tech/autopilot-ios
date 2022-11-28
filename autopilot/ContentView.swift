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
        ZStack(alignment: Alignment.top) {
            
            BackgroundView()
            SlideOverCard {
                VStack {
                    // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                    Handle()
                    SearchBar(text: $searchText)
                        
                    Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
