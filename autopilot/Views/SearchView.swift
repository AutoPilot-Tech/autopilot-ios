//
//  SearchView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, placeholder: "Search for a user...")
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    HStack { Spacer() }
                    
                    NavigationLink(destination: UserProfileView(user: user)) {
                        UserCell(user: user)
                    }
                }
            }.padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
