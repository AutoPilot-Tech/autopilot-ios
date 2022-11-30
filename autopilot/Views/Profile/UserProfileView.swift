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
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
            }
            
            .navigationTitle(user.fullname)
        }
    }
}

