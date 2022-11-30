//
//  GodView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

struct GodView: View {
    @State var selectedFilter: GodFilterOptions = .arcs

    var body: some View {
        VStack {
            GodFilterButtonView(selectedOption: $selectedFilter)
            Spacer()
                .navigationTitle("God View")
            if selectedFilter == .arcs {
                FeedView()
            } else if selectedFilter == .users {
                SearchView()
            } else {
                ConversationsView()
                
            }
        }
    }
}

struct GodView_Previews: PreviewProvider {
    static var previews: some View {
        GodView()
    }
}
