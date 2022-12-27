//
//  BottomSheet.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/27/22.
//

import SwiftUI

struct BottomSheet: View {
    @Binding var searchText: String
    
    
    var body: some View {
        VStack {
            Handle()
            HStack(spacing: 15) {
                SearchBar(text: $searchText, placeholder: "What do you want to open?")
            }
            .padding(.horizontal)
           
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(0..<3) { _ in
                        NewAppIconRow()
                            .background(.white)
                            .cornerRadius(10)
                            
                    }
                }
                .padding(.top)
            }
        }
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(15)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(searchText: .constant(""))
    }
}
