//
//  UserCell.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

struct UserCell: View {
//    let user:User
    
    var body: some View {
        HStack {
            // user profile img
            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Batman")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Bruce Wayne")
                    .font(.system(size: 14))
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
