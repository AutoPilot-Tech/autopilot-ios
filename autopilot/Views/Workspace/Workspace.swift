//
//  Workspace.swift
//  autopilot
//
//  Created by Matthew Molinar on 1/21/23.
//

import SwiftUI

struct Workspace: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "music.note")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 18, height: 18)
                        .padding(8)
                        
                }
                .background(.gray)
                .clipShape(Circle())
                Spacer()
                Text("Time")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 34, height: 34)
                        .foregroundColor(.gray)
                        .symbolRenderingMode(.multicolor)
                }
            }
            Spacer()
        }
    }
}

struct Workspace_Previews: PreviewProvider {
    static var previews: some View {
        Workspace()
    }
}
