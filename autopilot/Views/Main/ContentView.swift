//
//  ContentView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI
import Kingfisher
import Combine


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
                            KeyboardHost(offset: $offset, keyboardHeight: $keyboardHeight) {
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                                    if ((viewModel.isAdmin) != false) {
                                        switch autopilotViewRouter.currentPage {
                                        case .home:
                                            HomeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                        case .arcDetail:
                                            ArcModeDetailView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
                                            
                                        case .arcMode:
                                            RoutineModeView(autopilotViewRouter: autopilotViewRouter, slideTabShowing: $slideTabShowing)
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
                                                    BottomSheet(searchText: $searchText, offset: $offset, autopilotViewRouter: autopilotViewRouter, value: (-geometry.frame(in: .global).height + 160))
                                                        .offset(y: geometry.frame(in: .global).height - 160)
                                                        .offset(y: offset + keyboardHeight)
                                                        .gesture(DragGesture().onChanged({ (value) in
                                                            withAnimation{
                                                                // user is scrolling from bottom
                                                                if value.startLocation.y > geometry.frame(in: .global).midX{
//
                                                                
                                                                    if value.translation.height < 0 && offset > (-geometry.frame(in: .global).height + 160) {
                                                                        offset = value.translation.height
                                                                    } else {

                                                                        if offset == 100.0 {
                                                                            return
                                                                        } else {
                                                                            // for Analytics:
                                                                            // This will inform us if we need to make this feature.
                                                                            offset = value.translation.height
                                                                        }
                                                                        
                                                                    }
                                                                }
                                                                
                                                                if value.startLocation.y < geometry.frame(in: .global).midX{

                                                                    if value.translation.height > 0 && offset < 0 {
                                                                        offset = (-geometry.frame(in: .global).height + 160) + value.translation.height                                                                }
                                                                }
                                                            }
                                                            
                                                            
                                                        }).onEnded({ (value) in
                                                            withAnimation{
                                                                // starting from bottom of the screen
                                                                if value.startLocation.y > geometry.frame(in: .global).midX{
                                                                    if -value.translation.height > geometry.frame(in: .global).midX{
                                                                        offset = (-geometry.frame(in: .global).height + 150)
                                                                        return
                                                                    } else if value.translation.height > 0 {
                                                                        // user is dragging down
                                                                        offset = 120
                                                                        return
                                                                    }
                                                                    
                                                                    offset = 0
                                                                }
                                                                
                                                                // starting from the top of screen
                                                                if value.startLocation.y < geometry.frame(in: .global).midX{
                                                                    
                                                                    if value.translation.height < geometry.frame(in: .global).midX{
                                                                        offset = (-geometry.frame(in: .global).height + 150)
                                                                        return
                                                                    }
                                                                    
                                                                    offset = 0

                                                                }
                                                            
                                                            }
                                                            if offset == 0 {
                                                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                                    }
                                                        }))
                                                }
                                                .offset(x: -10) // hacky fix to make the geometry reader eat a dick
                                            }
                                            
                                            
                                            
                                        }
                                    } else {                                        
                                        NonAdminView(autopilotViewRouter: AutopilotViewRouter.shared, slideTabShowing: $slideTabShowing)
                                    }
                                }
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                                
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
    var iconName: String
    var appName: String
    var destination: Page
    var viewRouter: AutopilotViewRouter
    
    var body: some View {
        VStack {
            if self.destination == .coachChat {
                NavigationLink(destination: ChatView(user: COACH_MATTHEW), label: {
                    VStack {
                        Image(systemName: iconName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .symbolRenderingMode(.multicolor)
                            .foregroundColor(.blue)
                        
                        Text(appName)
                            .font(.footnote)
                            .foregroundColor(.blue)
                        
                    }
                })
            } else {
                Button(action: {
                    self.viewRouter.currentPage = self.destination
                }, label: {
                    VStack {
                        Image(systemName: iconName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .symbolRenderingMode(.multicolor)
                            .foregroundColor(.blue)
                        
                        Text(appName)
                            .font(.footnote)
                            .foregroundColor(.blue)
                        
                    }
            })
            }
            
        }
    }
}





protocol KeyboardObserving: AnyObject {
    func keyboardHeightPublisher() -> AnyPublisher<CGFloat, Never>
}

final class KeyboardResponder: ObservableObject {
    private var subscribers = Set<AnyCancellable>()
    private let keyboardWillShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        .map { $0.keyboardHeight }
    private let keyboardWillHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in CGFloat(0) }
    lazy var keyboardHeight: AnyPublisher<CGFloat, Never> = Publishers.Merge(keyboardWillShow, keyboardWillHide)
        .eraseToAnyPublisher()
}

struct KeyboardHost<Content: View>: View {
    let content: Content
    @Binding var keyboardHeight: CGFloat
    @Binding var offset: CGFloat

    init( offset: Binding<CGFloat>, keyboardHeight: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
            self.content = content()
            self._keyboardHeight = keyboardHeight
            self._offset = offset
        
        }


    var body: some View {
        content
            .onReceive(Publishers.keyboardHeight) {
                self.keyboardHeight = $0
                
            }
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        KeyboardResponder().keyboardHeight
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}



    





