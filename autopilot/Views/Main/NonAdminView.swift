//
//  MainTabView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI
import Kingfisher

struct NonAdminView: View {
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @EnvironmentObject var viewModel: AuthViewModel
    @State var searchText = ""

    @Binding var slideTabShowing: Bool // Bindable on other views

    var body: some View {
        ZStack {
            switch autopilotViewRouter.currentPage {
            case .home:
                WorkoutsView()
                    .padding(.top, UIScreen.main.bounds.height * 0.10)

                
            case .arcDetail:
                ArcModeDetailView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                   
                    

            case .arcMode:
                ArcModeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                    

            case .explore:
                VStack {
                    GodView()
                        .padding(.top, UIScreen.main.bounds.height * 0.14)
                }
                

            case .coachChat:
                ChatView(user: COACH_MATTHEW)

            case .profile:
                UserProfileView(user: viewModel.user ??  User(dictionary: FAKE_DATA))
                
            case .workouts:
                WorkoutsView()
                    .padding(.top, UIScreen.main.bounds.height * 0.10)
            case .recommended:
                HomeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.30)
                
                    

            }
            if slideTabShowing {
                VStack {
                    SlideOverCard {
                        ZStack(alignment: .topTrailing) {
                            
                            GeometryReader { geometry in
                                VStack {
                                    
                                    // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                                    Handle()
                                    SearchBar(text: $searchText, placeholder: "What tabs do you want to open?")
                                    // Tab Bar here
                                    ScrollView {
                                        RecommendedTabsHeader()
                                            // recommended tabs
                                        switch autopilotViewRouter.currentPage {
                                            // MARK: - Home page (Recommended)
                                        case .home:
                                            VStack {
                                                HStack {
                                                    AppIcon(geometry: geometry, iconName: "arrowtriangle.right.circle.fill", appName: "Quick Start")
                                                        .onTapGesture {
                                                            autopilotViewRouter.currentPage = .arcDetail
                                                        }
                                                    AppIcon(geometry: geometry, iconName: "heart.fill", appName: "For You")
                                                        .onTapGesture {
                                                        autopilotViewRouter.currentPage = .recommended
                                                        }
                                                    
                                                   
                                                    NavigationLink(destination: ChatView(user: COACH_MATTHEW)) {
                                                        VStack {
                                                                Image(systemName: "bubble.left.circle.fill")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                    .symbolRenderingMode(.multicolor)
                                                                    .foregroundColor(.green)
                                                                
                                                                Text("Text Coach")
                                                                    .font(.footnote)
                                                                    .foregroundColor(.blue)

                                                                    
                                                            }
                                                        .padding(.horizontal, -4)
                                                    }
                                                        
                                                             
                                                    
                                                    Spacer()
                                                    
                                                    
                                                    
                                                    
                                                }
                                                
                                                .padding(.top, -60.0)
                                            .frame(width: geometry.size.width, height: geometry.size.height/8)
                                                
                                                
                                            
                                       
                                            }
                                            
                                            // MARK: - Explore
                                       

                                        default:
                                            HStack {
                                                    VStack {
                                                        Image(systemName: "play.circle.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                            .symbolRenderingMode(.multicolor)
                                                            .foregroundColor(.blue)
                                                        
                                                        Text("Focus")
                                                            .font(.footnote)
                                                            .foregroundColor(.blue)
                                                    }
                                                    .padding(.horizontal, -4)
                                                    .onTapGesture {
                                                        autopilotViewRouter.currentPage = .arcDetail
                                                    }
                                                
                                                
                                                    VStack {
                                                        Image(systemName: "magnifyingglass.circle.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                            .symbolRenderingMode(.multicolor)
                                                            .foregroundColor(.pink)
                                                        
                                                        Text("Explore")
                                                            .font(.footnote)
                                                            .foregroundColor(.pink)
                                                    }
                                                    .padding(.horizontal, -4)
                                                    .onTapGesture {
                                                    autopilotViewRouter.currentPage = .explore
                                                    }
                                                
                                               
                                                NavigationLink(destination: ChatView(user: COACH_MATTHEW)) {
                                                    VStack {
                                                            Image(systemName: "bubble.left.circle.fill")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                .symbolRenderingMode(.multicolor)
                                                                .foregroundColor(.green)
                                                            
                                                            Text("Your Coach")
                                                                .font(.footnote)
                                                                .foregroundColor(.green)

                                                                
                                                        }
                                                    .padding(.horizontal, -4)
                                                }
                                                    
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                    
                                                         
                                                
                                                Spacer()
                                                
                                                
                                                
                                                
                                            }
                                            .padding(.top, -60.0)
                                            .frame(width: geometry.size.width, height: geometry.size.height/8)
                                            
                                        }
                                        
                                        
//                                                        HStack {
//
//                                                            HStack {
//                                                                Text("Shortcuts")
//                                                                    .frame(width: 115)
//                                                                    .font(.subheadline)
//                                                                    .foregroundColor(.gray)
//                                                                ComingSoon()
//
//                                                            }
//                                                            Spacer()
//
//                                                        }
//                                                        .padding(.top, -50)
                                        
                                        Spacer()
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

