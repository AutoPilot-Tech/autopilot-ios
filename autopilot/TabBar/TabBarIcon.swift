//
//  TabBarIcon.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct TabBarIcon: View {
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:width, height: height)
                .symbolRenderingMode(.multicolor)
            
            Text(tabName)
                .font(.footnote)
        }
        .padding(.horizontal, -4)
    }
}


struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIcon(width: 300, height: 100, systemIconName: "person.circle", tabName: "Profile")
    }
}
