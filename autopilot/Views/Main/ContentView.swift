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
    @State var offset: CGFloat = 0
    @State var keyboardHeight: CGFloat = 0
   
    
    
    var body: some View {
        Group {
            if (viewModel.userSession != nil) {
                if #available(iOS 16.0, *) {
                    NavigationStack {
                        Group {
                            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                                if ((viewModel.isAdmin) != false) {
                                    switch autopilotViewRouter.currentPage {
                                    case .home:
                                        HomeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                    case .arcDetail:
                                        ArcModeDetailView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                        
                                    case .arcMode:
                                        ArcModeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                    case .explore:
                                        GodView()
                                    case .coachChat:
                                        ChatView(user: COACH_MATTHEW)
                                    case .profile:
                                        UserProfileView(user: viewModel.user ??  User(dictionary: FAKE_DATA))
                                    case .workouts:
                                        WorkoutsView()
                                    case .recommended:
                                        HomeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                    case .tasks:
                                        TasksView()
                                    case .workoutGen:
                                        GenerateWorkoutView()
                                    case .schedule:
                                        ScheduleView()
                                    }
                                    if slideTabShowing {
                                        // Bottom Sheet
                                        GeometryReader { geometry in
                                            VStack {
                                                BottomSheet(searchText: $searchText, offset: $offset, value: (-geometry.frame(in: .global).height + 160))
                                                    .offset(y: geometry.frame(in: .global).height - 160)
                                                    .offset(y: offset + keyboardHeight)
                                                    .gesture(DragGesture().onChanged({ (value) in
                                                        withAnimation{
                                                            // user is scrolling up
                                                            if value.startLocation.y > geometry.frame(in: .global).midX{
                                                                if value.translation.height < 0 && offset > (-geometry.frame(in: .global).height + 160){
                                                                    offset = value.translation.height
                                                                }
                                                            }
                                                            
                                                            if value.startLocation.y < geometry.frame(in: .global).midX{
                                                                if value.translation.height > 0 && offset < 0 {
                                                                    offset = (-geometry.frame(in: .global).height + 160) + value.translation.height                                                                }
                                                                
                                                            }
                                                        }
                                                        
                                                        
                                                    }).onEnded({ (value) in
                                                        withAnimation{
                                                            // pulling up
                                                            if value.startLocation.y > geometry.frame(in: .global).midX{
                                                                if -value.translation.height > geometry.frame(in: .global).midX{
                                                                    offset = (-geometry.frame(in: .global).height + 150)
                                                                    return
                                                                }
                                                                
                                                                offset = 0
                                                            }
                                                            
                                                            if value.startLocation.y < geometry.frame(in: .global).midX{
                                                                if value.translation.height < geometry.frame(in: .global).midX{
                                                                    offset = (-geometry.frame(in: .global).height + 150)
                                                                    return
                                                                }
                                                                
                                                                offset = 0
                                                                
                                                            }
                                                        }
                                                        
                                                    }))
                                            }
                                        }
                                        
                                        
                                        
                                    }
                                } else {
                                    // user is just a fitness user.
                                    NonAdminView(autopilotViewRouter: AutopilotViewRouter.shared, slideTabShowing: $slideTabShowing)
                                }
                            }
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .onAppear {
                                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                                    // calculate the bottom edge of last message
                                    
                                    let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
                                    self.keyboardHeight = keyboardHeight
                                }
                            }
                            .onDisappear {
                                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                                self.keyboardHeight = 0
                                print("offset is now: \(offset + keyboardHeight)")
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.vertical)
                } else {
                    // Fallback on earlier versions
                }
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

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        return
    }
    
    typealias UIViewType = UIVisualEffectView
    
}
    

struct NewAppIcon: View {
    var body: some View {
        VStack {
            Image(systemName: "network")
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.blue)
            
            Text("Workouts")
                .font(.footnote)
                .foregroundColor(.blue)
            
        }
    }
}


struct NewAppIconRow: View {
    var body: some View {
        HStack(spacing: 65) {
            NewAppIcon()
            NewAppIcon()
            NewAppIcon()

        }
        .padding()
    }
}
    





