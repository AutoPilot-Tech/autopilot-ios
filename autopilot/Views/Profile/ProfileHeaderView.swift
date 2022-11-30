//
//  ProfileHeaderView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    let viewModel: ProfileViewModel
    var body: some View {
        VStack {
            
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x:0.0, y:0.0)
            
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("Member since March 2022")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size:16)).bold()
                    
                    Text("Arcs")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("47")
                        .font(.system(size:16)).bold()
                    
                    Text("Hours")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("3 Days")
                        .font(.system(size:16)).bold()
                    
                    Text("Streak")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            ProfileActionButtonView(isCurrentUser: viewModel.user.isCurrentUser, profileViewModel: viewModel)
            
            Spacer()

        }
    }
}

