//
//  UserProfileView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: AutopilotFilterOptions = .awards
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
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
