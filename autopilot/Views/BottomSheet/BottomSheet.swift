//
//  BottomSheet.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/27/22.
//

import SwiftUI

struct BottomSheet: View {
    @Binding var searchText: String
    @Binding var offset: CGFloat
    var value: CGFloat
    
    var body: some View {
        VStack {
            Handle()
            HStack(spacing: 15) {
                TextField("", text: $searchText) { status in
                    withAnimation {
                        if status {
                            print("just ran")
                            offset = value
                        } else {
                            offset = 0
                        }
                    }
                } 
                
                    .placeholder(when: searchText.isEmpty) {
                        Text("What do you want to open?").foregroundColor(.gray)
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

