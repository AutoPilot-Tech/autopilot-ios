//
//  ContentView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI
import Kingfisher


struct ContentView : View {
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @State var currentIndex: Int = 0
    @State var searchText = ""
    @State var textfield_val = ""
    @State var heartFilled = false
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isLoggedIn = true
    @State var slideTabShowing = true // Bindable on other views
   
    
    
    var body: some View {
        Group {
            if (viewModel.userSession != nil) {
                NavigationView {
                    Group {
                        ZStack(alignment: Alignment.top) {
                            
                            if ((viewModel.isAdmin) != false) {
                                switch autopilotViewRouter.currentPage {
                                case .home:
                                    HomeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                        .padding(.bottom, UIScreen.main.bounds.height * 0.30)

                                case .arcDetail:
                                    ArcModeDetailView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                   
                                case .arcMode:
                                    ArcModeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                        
                                case .explore:
                                    VStack {
                                        GodView()
                                            .padding(.top, UIScreen.main.bounds.height * 0.10)
                                    }

                                case .coachChat:
                                    ChatView(user: COACH_MATTHEW)

                                case .profile:
                                    UserProfileView(user: viewModel.user ??  User(dictionary: FAKE_DATA))
                                case .workouts:
                                    WorkoutsView()
                                        

                                case .recommended:
                                    HomeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                        .padding(.bottom, UIScreen.main.bounds.height * 0.30)
                                case .tasks:
                                    TasksView()
                                case .workoutGen:
                                    GenerateWorkoutView()
                                
                                }
                                if slideTabShowing {
                                    VStack {
                                        SlideOverCard {
                                            ZStack(alignment: .topTrailing) {
                                                
                                                GeometryReader { geometry in
                                                    VStack {
                                                        
                                                        // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                                                        Handle()
                                                        SearchBar(text: $searchText, placeholder: "What tab do you want to open?")
                                                        // Tab Bar here
                                                        RecommendedTabsHeader()
                                                        ScrollView {
                                                            
                                                                // recommended tabs
                                                            switch autopilotViewRouter.currentPage {
                                                                // MARK: - Home page
                                                            case .home:
                                                                IconDrawer(geometry: geometry, autopilotViewRouter: autopilotViewRouter, viewModel: _viewModel)
                                                                
                                                                // MARK: - Explore
                                                            case .explore:
                                                                IconDrawer(geometry: geometry, autopilotViewRouter: autopilotViewRouter, viewModel: _viewModel)

                                                            default:
                                                                IconDrawer(geometry: geometry, autopilotViewRouter: autopilotViewRouter, viewModel: _viewModel)
                                                                
                                                            }
                                                            Spacer()
                                                        }
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                // user is just a fitness user.
                                NonAdminView(autopilotViewRouter: AutopilotViewRouter.shared, slideTabShowing: $slideTabShowing)
                            }
                        }
                    }
                }
            .edgesIgnoringSafeArea(.vertical)
            } else {
                LoginView()
            }
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(autopilotViewRouter: AutopilotViewRouter())
                .environmentObject(AuthViewModel())
        }
    }
    
    





