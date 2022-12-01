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
            
                
        
        }
    }
}

struct ArcModeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeDetailView()
    }
}
