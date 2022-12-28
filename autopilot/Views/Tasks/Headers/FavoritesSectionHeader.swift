//
//  FavoritesSectionHeader.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/28/22.
//

import SwiftUI

// Custom view for the section headers
struct FavoritesSectionHeader: View {
    var title: String
    @Binding var isExpanded: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            
            Button(action: {
                self.isExpanded.toggle()
            }) {
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct FavoritesSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesSectionHeader(title: "Favorites", isExpanded: .constant(false))
    }
}
