//
//  UserProfileView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct UserProfileView: View {

    @State var selectedFilter: AutopilotFilterOptions = .arcs
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
                
                if selectedFilter == .arcs {
                    ForEach(viewModel.userArcs) { arc in
                        ArcCell(arc: arc)
                            .padding()
                    }
                }
            }
            
            .navigationTitle(user.fullname)
        }
    }
}

