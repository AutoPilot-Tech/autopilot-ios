//
//  IconDrawer.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/26/22.
//

import SwiftUI
import Kingfisher

// STATIC, BUT WILL BE DYNAMIC LATER

struct IconDrawer: View {
    @State var isShowingNewArcView = false
    let geometry: GeometryProxy
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @EnvironmentObject var viewModel: AuthViewModel
    let isAdmin: Bool

    var body: some View {
        VStack {
            // MARK: - First Row
            HStack {
                // Focus
                AppIcon(geometry: geometry, iconName: "arrowtriangle.right.circle.fill", appName: "Focus")
                    .onTapGesture {
                        autopilotViewRouter.currentPage = .arcDetail
                    }
                // Home
                AppIcon(geometry: geometry, iconName: "heart.fill", appName: "Home")
                
                    .onTapGesture {
                    autopilotViewRouter.currentPage = .home
                    }
                
               // Post Arc
                Button(action: {
                    isShowingNewArcView.toggle()
                }) {
                    VStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                .symbolRenderingMode(.multicolor)
                                .foregroundColor(.green)
                            
                            Text("Post Arc")
                                .font(.footnote)
                                .foregroundColor(.green)
                        }
                    .padding(.horizontal, -4)
                }
                .fullScreenCover(isPresented: $isShowingNewArcView) {
                    NewArcView(isPresented: $isShowingNewArcView)
                }
                Spacer()

            }
            .padding(.top, -40.0)
            .frame(width: geometry.size.width, height: geometry.size.height/8)
            
            
            // MARK: - Second Row
            HStack {
                // Schedule
                AppIcon(geometry: geometry, iconName: "calendar.circle.fill", appName: "See Schedule")
                    .onTapGesture {
                        autopilotViewRouter.currentPage = .arcDetail
                    }
                // Tasks
                AppIcon(geometry: geometry, iconName: "bolt.horizontal.circle.fill", appName: "Tasks")
                    .onTapGesture {
                    autopilotViewRouter.currentPage = .explore
                    }
                
               // Profile
                    NavigationLink(destination: UserProfileView(user: viewModel.user ??  User(dictionary: FAKE_DATA))) {
                        VStack {
                            KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                                .resizable()
                                .frame(width: 32, height: 32)
                                .scaledToFill()
                                .clipShape(Circle())
                                                                                            
                            Text("Profile")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                        .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                        
                        }
                Spacer()

            }
            
            .padding(.top, -100)
        .frame(width: geometry.size.width, height: geometry.size.height/8)
            
            // MARK: - Third Row
            HStack {
                AppIcon(geometry: geometry, iconName: "stopwatch.fill", appName: "My Workouts")
                    .onTapGesture {
                        autopilotViewRouter.currentPage = .workouts
                    }
                AppIcon(geometry: geometry, iconName: "network", appName: "God Mode")
                    .onTapGesture {
                        autopilotViewRouter.currentPage = .explore
                    }
                AppIcon(geometry: geometry, iconName: "pencil.circle.fill", appName: "Make Workout")
                    .onTapGesture {
                        autopilotViewRouter.currentPage = .workoutGen
                    }
            }
            .padding(.top, -150)
        .frame(width: geometry.size.width, height: geometry.size.height/8)
        }
    }
}

