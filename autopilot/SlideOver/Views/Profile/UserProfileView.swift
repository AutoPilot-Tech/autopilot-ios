//
//  UserProfileView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
            }
            
            .navigationTitle("Bruce Wayne")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
