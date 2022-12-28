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
    var appNames: [String] = [
        "Start Workout", "Workouts", "Text Coach", "Schedule", "Tasks", "Profile", "Settings", "God", "Create"
    ]
    var iconNames: [String] = [
        "play.circle.fill", "stopwatch.fill", "bubble.right.fill", "calendar.circle.fill", "bolt.horizontal.circle.fill", "person.circle.fill", "gear", "network", "pencil.circle.fill"
    ]
    
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
                    ForEach(Array(stride(from: 0, to: iconNames.count, by: 3)), id: \.self) { index in
                                        NewAppIconRow(iconNames: Array(self.iconNames[index..<index+3]), appNames: Array(self.appNames[index..<index+3]))
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

