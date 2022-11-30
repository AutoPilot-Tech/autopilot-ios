//
//  ArcDetailView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Kingfisher

struct ArcDetailView: View {
    var arc: Arc
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                KFImage(URL(string: arc.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(arc.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(arc.username)")
                        .font(.system(size:14))
                        .foregroundColor(.gray)
                }
            }
            
            Text(arc.title)
                .font(.system(size: 22))
            
            Text("7:22 PM 05/01/2022")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            
            
            Spacer()
        }.padding()
    }
}

