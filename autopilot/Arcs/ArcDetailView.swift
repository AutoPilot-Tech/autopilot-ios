//
//  ArcDetailView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

struct ArcDetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@batman")
                        .font(.system(size:14))
                        .foregroundColor(.gray)
                }
            }
            
            Text("I am a dog")
                .font(.system(size: 22))
            
            Text("7:22 PM 05/01/2022")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            
            
            Spacer()
        }.padding()
    }
}

struct ArcDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArcDetailView()
    }
}
