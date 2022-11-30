//
//  NewArcView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

struct NewArcView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    TextArea("What Arc are you in?", text: $captionText)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: { isPresented.toggle() }) {
                    Text("Cancel")
                        .foregroundColor(.blue)
                })
            }
        }
    }
}

