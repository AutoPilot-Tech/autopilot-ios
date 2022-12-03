//
//  ProfileActionButtonView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool
    let profileViewModel: ProfileViewModel
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if isCurrentUser {
            HStack {
                Button(action: {}, label: {
                    Text("Edit Profile")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
                .cornerRadius(20)
                
                Button(action: {
                    viewModel.signOut()
                }, label: {
                    Text("Sign Out")
                        .frame(width: 180, height: 40)
                        .background(Color.red)
                        .foregroundColor(.white)
                })
                .cornerRadius(20)
            }
            
        } else {
            HStack {
                NavigationLink(destination: GenerateWorkoutView()) {
                        Text("Make Workout")
                            .frame(width: 180, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                }

                
                NavigationLink(destination: ChatView(user: profileViewModel.user)) {
                        Text("Message")
                            .frame(width: 180, height: 40)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                }

            }
        }
        
    }
}

