//
//  AnimatedCardView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/14/22.
//

import SwiftUI


struct AnimatedCardView: UIViewRepresentable {
    func makeUIView(context: Context) -> MadeForYouCard {
        return MadeForYouCard()
    }
    
    func updateUIView(_ uiView: MadeForYouCard, context: Context) {
        uiView.animateGradient()
    }
    
}
