//
//  ContentView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI


struct ContentView : View {
    @State var searchText = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isLoggedIn = true
    
    var body: some View {
        Group {
            if (viewModel.userSession != nil) {
                NavigationView {
                // TODO: Send the height needed for tab bar, then add to current height
                    Group {
                        ZStack {
                            BackgroundView()
                            // Coach
                            
                            SlideOverCard {
                                ZStack(alignment: .topTrailing) {
                                    
                                    GeometryReader { geometry in
                                        VStack {
                                            
                                            // for some reason Handle needs to go here... ideally it would need to be inside the SlideOverCard definition.
                                            Handle()
                                            SearchBar(text: $searchText, placeholder: "What do you want to do?")
                                            // Tab Bar here
                                            HStack {
                                                
                                                HStack {
                                                    Text("Recommended")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                    .padding()
                                                    BetaTag()
                                                    
                                                }
                                                Spacer()
                                                
                                            }
                                                

                                            HStack {
                                                NavigationLink(destination: UserProfileView()) {
                                                    VStack {
                                                        Image(systemName: "play.circle.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                            .symbolRenderingMode(.multicolor)
                                                            .foregroundColor(.blue)
                                                        
                                                        Text("Focus")
                                                            .font(.footnote)
                                                    }
                                                    .padding(.horizontal, -4)
                                                }
                                                
                                                
                                                NavigationLink(destination: ContentView()) {
                                                    VStack {
                                                        Image(systemName: "heart.circle.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                            .symbolRenderingMode(.multicolor)
                                                        
                                                        Text("For You")
                                                            .font(.footnote)
                                                    }
                                                    .padding(.horizontal, -4)
                                                }
                                                
                                                NavigationLink(destination: ChatView()) {
                                                    VStack {
                                                        Image(systemName: "bubble.left.circle.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                            .symbolRenderingMode(.multicolor)
                                                            .foregroundColor(.green)
                                                        
                                                        Text("Your Coach")
                                                            .font(.footnote)
                                                    }
                                                    .padding(.horizontal, -4)
                                                }
                                                
                                                
                                                
                                                
                                                
                                                
                                                    
                                                         
                                                
                                                Spacer()
                                                
                                                
                                                
                                                
                                            }
                                            .padding(.top, -60.0)
                                            .frame(width: geometry.size.width, height: geometry.size.height/8)
                                            HStack {
                                                
                                                Text("Shortcuts")
                                                    .padding()
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                Spacer()
                                                
                                            }
                                            .padding(.top, -65)
                                            NavigationLink(destination: SearchView()) {
                                                VStack {
                                                    Image(systemName: "eye.trianglebadge.exclamationmark.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                                                        .symbolRenderingMode(.multicolor)
                                                        .foregroundColor(.green)
                                                    
                                                    Text("God View")
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
                    .navigationTitle("Autopilot")
                    

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
            ContentView()
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
