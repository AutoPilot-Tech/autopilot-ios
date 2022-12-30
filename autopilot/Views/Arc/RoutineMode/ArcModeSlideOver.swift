//
//  ArcModeSlideOver.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/2/22.
//

import SwiftUI

struct ArcModeSlideOver<Content: View> : View {
    @GestureState private var dragState = DragState.inactive
    @State var position = ArcModeCardPosition.bottom
    @State var labelNumber = 1

    
    var content: () -> Content
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        
        return ZStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: ChatView(user: COACH_MATTHEW)) {
                        VStack {
                            Image("batman")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(NotificationNumLabel(number: $labelNumber))
                                .frame(width: 56, height: 56)
                        }
                        
                    }
                        .padding()
                        .offset(y: self.position.position + 15 + self.dragState.translation.height)
                        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                        
                    
                    
                }
                Group {
                    self.content()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.white)
                .cornerRadius(10.0)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 14.0)
                .offset(y: self.position.position + self.dragState.translation.height)
                .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
            .gesture(drag)
            }
            
            
        }
        
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let cardTopEdgeLocation = self.position.position + drag.translation.height
        let positionAbove: ArcModeCardPosition
        let positionBelow: ArcModeCardPosition
        let closestPosition: ArcModeCardPosition
        
        if cardTopEdgeLocation <= ArcModeCardPosition.middle.position {
            positionAbove = .top
            positionBelow = .middle
        } else {
            positionAbove = .middle
            positionBelow = .bottom
        }
        
        if (cardTopEdgeLocation - positionAbove.position) < (positionBelow.position - cardTopEdgeLocation) {
            closestPosition = positionAbove
        } else {
            closestPosition = positionBelow
        }
        
        if verticalDirection > 0 {
            self.position = positionBelow
        } else if verticalDirection < 0 {
            self.position = positionAbove
        } else {
            self.position = closestPosition
        }
    }
}

enum ArcModeCardPosition: CGFloat {
    case top
    case middle
    case bottom
    
    var position: CGFloat {
        switch self {
        case .top:
            return UIScreen.main.bounds.height * 0.50
        case .middle:
            return UIScreen.main.bounds.height * 0.65
        case .bottom:
            return UIScreen.main.bounds.height * 0.70
        }

    }
}



struct ArcModeSlideOver_Previews: PreviewProvider {
    static var previews: some View {
        ArcModeSlideOver( content: {
            VStack {
                Handle()
                SearchBar(text: .constant("Search Autopilot..."), placeholder: "What do you want to do?")
                Spacer()
            }
        })
    }
}

