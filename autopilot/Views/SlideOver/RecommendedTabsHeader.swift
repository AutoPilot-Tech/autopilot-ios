//
//  RecommendedTabs.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI

struct RecommendedTabsHeader: View {
    var body: some View {
        HStack {
            
            HStack {
                Text("Recommended Tabs")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 150)
                .padding()
                BetaTag()
                
            }
            Spacer()
            
        }
    }
}

struct ShortcutsHeader: View {
    var body: some View {
        HStack {
            
            HStack {
                Text("Shortcuts")
                    .font(.subheadline)
                    .foregroundColor(.gray)
//                    .frame(width: 150)
                BetaTag()
                
            }
            Spacer()
            
        }
    }
}

struct RecommendedTabsHeader_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedTabsHeader()
    }
}
