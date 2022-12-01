//
//  SuccessView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/1/22.
//

import SwiftUI

struct SuccessView: View {
    @State var feedbackText: String = ""
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "checkmark.square.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.green)
                Text("Workout Completed")
                Text("10:45 PM")
            }.padding(.top, 50)
                
            
            Text("Day 2")
            Text("Back/Bicep")
                .padding(.bottom, 100)
            
            Text("Feedback")
            TextArea("Let Matthew know how you liked your workout...", text: $feedbackText)
                .frame(height: 200)
            
            Button(action: {
                // slide card
                // go home
            }) {
                Text("Done")
            }
        }
        .padding()
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
