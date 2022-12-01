//
//  ContentView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI
import Kingfisher


struct ContentView : View {
    @StateObject var autopilotViewRouter: AutopilotViewRouter
    @State var currentIndex: Int = 0
    @State var searchText = ""
    @State var textfield_val = ""
    @State var heartFilled = false
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isLoggedIn = true
    let fakeData = ["email": "fake@email.com",
                "username": "error",
                "fullname": "error",
                "profileImageUrl": "error",
                "uid": "error"]
    
    var body: some View {
        Group {
            if (viewModel.userSession != nil) {
                NavigationView {
                // TODO: Send the height needed for tab bar, then add to current height
                    Group {
                        ZStack(alignment: Alignment.top) {
                            Color.white
                                .ignoresSafeArea()
//                            BackgroundView()
                            
                            switch autopilotViewRouter.currentPage {
                            case .home:
                                CarouselView(itemHeight: 400, views: [
                                AnyView(
                                    NavigationLink(destination: ArcModeDetailView()) {
                                        ArcCardContent()

                                    }

                                    ),
                                AnyView(ArcCardContent()),
                                AnyView(ArcCardContent()),
                                AnyView(ArcCardContent()),

                            ])
                                .padding(.top, -UIScreen.main.bounds.height * 0.20)
                                
                            case .arcDetail:
                                ArcModeDetailView()
                                    

                            case .arcMode:
                                ArcModeView()
                                    

                            case .explore:
                                VStack {
                                    GodView()
                                        .padding(.top, UIScreen.main.bounds.height * 0.15)
                                }
                                

                            case .coachChat:
                                ConversationsView()
                                    

                            case .profile:
                                UserProfileView(user: viewModel.user ??  User(dictionary: fakeData))
                                    

                            }
                            VStack {
                                SlideOverCard {
                                    ZStack(alignment: .topTrailing) {
                                        
                                        GeometryReader { geometry in
                                            VStack {
                                                
                                                // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                                                Handle()
                                                SearchBar(text: $searchText, placeholder: "What do you want to do?")
                                                // Tab Bar here
                                                ScrollView {
                                                    HStack {
                                                        
                                                        HStack {
                                                            Text("Recommended")
                                                                .font(.subheadline)
                                                                .foregroundColor(.gray)
                                                                .frame(width: 115)
                                                            .padding()
                                                            BetaTag()
                                                            
                                                        }
                                                        Spacer()
                                                        
                                                    }
                                                        

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
                                                            .onTapGesture {
                                                            autopilotViewRouter.currentPage = .coachChat
                                                            }
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                            
                                                                 
                                                        
                                                        Spacer()
                                                        
                                                        
                                                        
                                                        
                                                    }
                                                    .padding(.top, -60.0)
                                                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                                                    HStack {
                                                        
                                                        HStack {
                                                            Text("Shortcuts")
                                                                .frame(width: 115)
                                                                .font(.subheadline)
                                                                .foregroundColor(.gray)
                                                            ComingSoon()
                                                            
                                                        }
                                                        Spacer()
                                                        
                                                    }
                                                    .padding(.top, -50)
                                                    NavigationLink(destination: GodView()) {
                                                        VStack {
                                                            Image(systemName: "magnifyingglass.circle")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                                .symbolRenderingMode(.multicolor)
                                                                .foregroundColor(.pink)
                                                            
                                                            Text("Explore")
                                                                .font(.footnote)
                                                        }
                                                        .padding(.horizontal, -4)
                                                    }
                                                    Spacer()
                                                }
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            
                                
                            
                            
                            
                            
                            
                        }
                        
                    }
                    .navigationBarItems( trailing: NavigationLink(destination: UserProfileView(user: viewModel.user ??  User(dictionary: fakeData))) {
                        KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 32, height: 32)
                            .cornerRadius(16)
                    } )
                    
                    
                    
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
    
    


struct BetaTag: View {
    var body: some View {
        Text("Beta")
            .fixedSize(horizontal: true, vertical: false)
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 50, height: 20)
            .background(Rectangle().fill(Color.blue.opacity(0.3)).shadow(radius: 3))
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.system(size: 12, weight: .semibold))
        
    }
}

struct ComingSoon: View {
    var body: some View {
        Text("Coming Soon")
            .fixedSize(horizontal: true, vertical: false)
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 100, height: 20)
            .background(Rectangle().fill(Color.blue.opacity(0.3)).shadow(radius: 3))
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.system(size: 12, weight: .semibold))
        
    }
}
