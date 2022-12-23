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
                                            .padding(.top, UIScreen.main.bounds.height * 0.14)
                                    }
                                    

                                case .coachChat:
                                    ChatView(user: COACH_MATTHEW)

                                case .profile:
                                    UserProfileView(user: viewModel.user ??  User(dictionary: FAKE_DATA))
                                case .workouts:
                                    WorkoutsView()
                                        

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
                                                                VStack {
                                                                    HStack {
                                                                            VStack {
                                                                                Image(systemName: "arrowtriangle.right.circle.fill")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                                    .symbolRenderingMode(.multicolor)
                                                                                    .foregroundColor(.blue)
                                                                                
                                                                                Text("Start Focus")
                                                                                    .font(.footnote)
                                                                                    .foregroundColor(.blue)
                                                                            }
                                                                            .padding(.horizontal, -4)
                                                                            .onTapGesture {
                                                                                autopilotViewRouter.currentPage = .arcDetail
                                                                            }
                                                                        
                                                                        
                                                                            VStack {
                                                                                Image(systemName: "network")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                                    .symbolRenderingMode(.multicolor)
                                                                                    .foregroundColor(.cyan)
                                                                                
                                                                                Text("Explore")
                                                                                    .font(.footnote)
                                                                                    .foregroundColor(.blue)
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
                                                                                    
                                                                                    Text("Text Coach")
                                                                                        .font(.footnote)
                                                                                        .foregroundColor(.green)

                                                                                        
                                                                                }
                                                                            .padding(.horizontal, -4)
                                                                        }
                                                                            
                                                                                 
                                                                        
                                                                        Spacer()
                                                                        
                                                                        
                                                                        
                                                                        
                                                                    }
                                                                    
                                                                    .padding(.top, -60.0)
                                                                .frame(width: geometry.size.width, height: geometry.size.height/8)
                                                                    
                                                                    
                                                                    HStack {
                                                                        VStack {
                                                                            Image(systemName: "calendar.circle.fill")
                                                                                .resizable()
                                                                                .aspectRatio(contentMode: .fit)
                                                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                                .symbolRenderingMode(.multicolor)
                                                                                .foregroundColor(.red)
                                                                            
                                                                            Text("See Schedule")
                                                                                .font(.footnote)
                                                                                .foregroundColor(.red)
                                                                        }
                                                                        .padding(.horizontal, -4)
                                                                        .onTapGesture {
                                                                            autopilotViewRouter.currentPage = .arcDetail
                                                                        }
                                                                        
                                                                        
                                                                        VStack {
                                                                            Image(systemName: "bolt.horizontal.circle.fill")
                                                                                .resizable()
                                                                                .aspectRatio(contentMode: .fit)
                                                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                                .symbolRenderingMode(.multicolor)
                                                                                .foregroundColor(.orange)
                                                                            
                                                                            Text("Tasks")
                                                                                .font(.footnote)
                                                                                .foregroundColor(.orange)
                                                                        }
                                                                        .padding(.horizontal, -4)

                                                                        
                                                                       
                                                                        
                                                                        
                                                                        HStack {
                                                                            Spacer()
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

                                                                            }

                                                                            Spacer()
                                                                        }
                                                                        .padding(.horizontal, -4)

                                                                            
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                            
                                                                                 
                                                                        
                                                                        Spacer()
                                                                        
                                                                        
                                                                        
                                                                        
                                                                    }
                                                                    .padding(.top, -80.0)
                                                                .frame(width: geometry.size.width, height: geometry.size.height/8)
                                                                }
                                                                
                                                                // MARK: - Explore
                                                            case .explore:
                                                                VStack {
                                                                    HStack {
                                                                            VStack {
                                                                                Image(systemName: "arrowtriangle.right.circle.fill")
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
                                                                                Image(systemName: "heart.fill")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                                    .symbolRenderingMode(.hierarchical)
                                                                                    .foregroundColor(.red)
                                                                                
                                                                                Text("Home")
                                                                                    .font(.footnote)
                                                                                    .foregroundColor(.red)
                                                                            }
                                                                            .padding(.horizontal, -4)
                                                                            .onTapGesture {
                                                                            autopilotViewRouter.currentPage = .home
                                                                            }
                                                                        
                                                                       
                                                                        NavigationLink(destination: ChatView(user: COACH_MATTHEW)) {
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
                                                                            
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                            
                                                                                 
                                                                        
                                                                        Spacer()
                                                                        
                                                                        
                                                                        
                                                                        
                                                                    }
                                                                    
                                                                    
                                                                    
                                                                    HStack {
                                                                            VStack {
                                                                                Image(systemName: "calendar.circle.fill")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                                    .symbolRenderingMode(.multicolor)
                                                                                    .foregroundColor(.red)
                                                                                
                                                                                Text("See Schedule")
                                                                                    .font(.footnote)
                                                                                    .foregroundColor(.red)
                                                                            }
                                                                            .padding(.horizontal, -4)
                                                                            .onTapGesture {
                                                                                autopilotViewRouter.currentPage = .arcDetail
                                                                            }
                                                                        
                                                                        
                                                                            VStack {
                                                                                Image(systemName: "bolt.horizontal.circle.fill")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                                    .symbolRenderingMode(.multicolor)
                                                                                    .foregroundColor(.orange)
                                                                                
                                                                                Text("Tasks")
                                                                                    .font(.footnote)
                                                                                    .foregroundColor(.orange)
                                                                            }
                                                                            .padding(.horizontal, -4)
                                                                            .onTapGesture {
                                                                            autopilotViewRouter.currentPage = .explore
                                                                            }
                                                                        
                                                                       
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
                                                                }

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
    
    





