//
//  SlideOverCard.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct SlideOverCard<Content: View> : View {
    @GestureState private var dragState = DragState.inactive
    @State var position = CardPosition.bottom
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
//                HStack {
//                    Spacer()
//                    NavigationLink(destination: ChatView(user: COACH_MATTHEW)) {
//                        VStack {
//                            Image("batman")
//                                .resizable()
//                                .scaledToFill()
//                                .clipShape(Circle())
//                                .overlay(NotificationNumLabel(number: $labelNumber))
//                                .frame(width: 56, height: 56)
//                        }
//                        
//                    }
//                        .padding()
//                        .offset(y: self.position.rawValue + 15 + self.dragState.translation.height)
//                        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
//                        
//                    
//                    
//                }
                Group {
                    self.content()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.white)
                .cornerRadius(10.0)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 14.0)
                .offset(y: self.position.rawValue + self.dragState.translation.height)
                .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
            .gesture(drag)
            }
            
            
        }
        
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let cardTopEdgeLocation = self.position.rawValue + drag.translation.height
        let positionAbove: CardPosition
        let positionBelow: CardPosition
        let closestPosition: CardPosition
        
        if cardTopEdgeLocation <= CardPosition.middle.rawValue {
            positionAbove = .top
            positionBelow = .middle
        } else {
            positionAbove = .middle
            positionBelow = .bottom
        }
        
        if (cardTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - cardTopEdgeLocation) {
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

enum CardPosition: CGFloat {
    case top = 400
    case middle = 500
    case bottom = 625
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct SlideOverCard_Previews: PreviewProvider {
    static var previews: some View {
        SlideOverCard( content: {
            VStack {
                Handle()
                SearchBar(text: .constant("Search Autopilot..."), placeholder: "What do you want to do?")
                Spacer()
            }
        })
    }
}

