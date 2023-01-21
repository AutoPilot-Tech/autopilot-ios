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
            WorkspaceHeader()
            Spacer()
        }
    }
}

struct Workspace_Previews: PreviewProvider {
    static var previews: some View {
        Workspace()
    }
}

struct WorkspaceHeader: View {
    var body: some View {
        HStack {
            VStack {
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
                .shadow(color: .black, radius: 4, x: 2, y: 2)
                Text("Music")
                    .font(.footnote)
                    .shadow(color: .black, radius: 4, x: 2, y: 2)

            }
            Spacer()
            Rectangle()
                .frame(width: 200, height: 50)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .shadow(color: .black, radius: 4, x: 2, y: 2)
                .overlay {
                    Text("20:00")
                        .foregroundColor(.white)
                        .font(.title)
                }
            Spacer()
            VStack {
                Button(action: {}) {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 34, height: 34)
                        .foregroundColor(.gray)
                        .symbolRenderingMode(.multicolor)
                        .shadow(color: .black, radius: 4, x: 2, y: 2)

                }
                Text("Start")
                    .font(.footnote)
                    .shadow(color: .black, radius: 4, x: 2, y: 2)

            }
        }
        .padding(.horizontal)
    }
}
