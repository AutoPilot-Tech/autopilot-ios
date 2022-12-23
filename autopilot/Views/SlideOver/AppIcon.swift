//
//  AppIcon.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI

struct AppIcon: View {
    var geometry: GeometryProxy
    var iconName: String
    var appName: String
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:geometry.size.width/3, height: geometry.size.height/28)
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.blue)
            
            Text(appName)
                .font(.footnote)
                .foregroundColor(.blue)
        }
        .padding(.horizontal, -4)
    }
}


