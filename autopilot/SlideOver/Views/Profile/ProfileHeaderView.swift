//
//  ProfileHeaderView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            
            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 10, x:0.0, y:0.0)
            
            Text("Bruce Wayne")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("Member since March 2022")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size:16)).bold()
                    
                    Text("Workouts")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("47")
                        .font(.system(size:16)).bold()
                    
                    Text("Focus Hours")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 8)
            
            
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
