//
//  SearchView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    
    let placeholder: String
    
    var body: some View {
        HStack {
            TextField("", text: $text) {
                
            }
                .placeholder(when: text.isEmpty) {
                    Text(placeholder).foregroundColor(.gray)
                }
                .foregroundColor(Color(.systemGray))
                .padding(8)
                .padding(.horizontal, 24)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                    )
        }.padding(.horizontal, 10)
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: .constant("Search..."), placeholder: .constant("Hi"))
//    }
//}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
