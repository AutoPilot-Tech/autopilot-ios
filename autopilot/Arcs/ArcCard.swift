//
//  ArcCard.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI
import Firebase

struct ArcCard: View {
    // MARK: Glassmorphism Properties
    @State var blurView: UIVisualEffectView = .init()
    @State var defaultBlurRadius: CGFloat = 0
    @State var defaultSaturationAmount: CGFloat = 0
    var body: some View {
        ZStack {
            }

        }
        
        
        
            
    
    
   
    
   



    
}




struct ArcCard_Previews: PreviewProvider {
    static var previews: some View {
        ArcCard()
    }
}


// Sample Data =

struct MockArcCard: Identifiable {
    let id: Int
    let username: String
    let profileImageUrl: String
    let fullname: String
    let description: String
    let uid: String
    let featuredImageUrl: String
    let timestamp: Timestamp
    let title: String
}



let mocks: [MockArcCard] = [
    .init(id: 0, username: "batman", profileImageUrl: "Hey what's up?", fullname: "rg", description : "ergewg", uid: "rggr", featuredImageUrl: "efef", timestamp: Timestamp(date: Date()), title: "srgf3"),
    .init(id: 1, username: "batman", profileImageUrl: "Hey what's up?", fullname: "rg", description : "ergewg", uid: "rggr", featuredImageUrl: "efef", timestamp: Timestamp(date: Date()), title: "44234"),
    .init(id: 2, username: "batman", profileImageUrl: "Hey what's up?", fullname: "rg", description : "ergewg", uid: "rggr", featuredImageUrl: "efef", timestamp: Timestamp(date: Date()), title: "dddddd"),
    .init(id: 3, username: "batman", profileImageUrl: "Hey what's up?", fullname: "rg", description : "ergewg", uid: "rggr", featuredImageUrl: "efef", timestamp: Timestamp(date: Date()), title: "ffff"),
    .init(id: 4, username: "batman", profileImageUrl: "Hey what's up?", fullname: "rg", description : "ergewg", uid: "rggr", featuredImageUrl: "efef", timestamp: Timestamp(date: Date()), title: "srgf3"),
    .init(id: 5, username: "batman", profileImageUrl: "Hey what's up?", fullname: "rg", description : "ergewg", uid: "rggr", featuredImageUrl: "efef", timestamp: Timestamp(date: Date()), title: "srgf3"),
    .init(id: 6, username: "batman", profileImageUrl: "Hey what's up?", fullname: "rg", description : "ergewg", uid: "rggr", featuredImageUrl: "efef", timestamp: Timestamp(date: Date()), title: "srgf3"),
    
]



//struct CustomBlurView: UIViewRepresentable {
//    var effect: UIBlurEffect.Style
//    var onChange: (UIVisualEffectView)->()
//}
