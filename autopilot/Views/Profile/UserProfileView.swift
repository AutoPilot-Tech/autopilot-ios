//
//  UserProfileView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct UserProfileView: View {

    @State var selectedFilter: AutopilotFilterOptions = .awards
    let user: User
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
            }
            
            .navigationTitle(user.fullname)
        }
    }
}

