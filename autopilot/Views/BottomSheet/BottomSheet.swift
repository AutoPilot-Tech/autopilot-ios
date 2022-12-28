//
//  BottomSheet.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/27/22.
//

import SwiftUI

let columns = [GridItem(.fixed(UIScreen.main.bounds.width / 3)), GridItem(.fixed(UIScreen.main.bounds.width / 3)), GridItem(.fixed(UIScreen.main.bounds.width / 3))
]

struct BottomSheet: View {
    @Binding var searchText: String
    @Binding var offset: CGFloat
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter

    var value: CGFloat
    var appNames: [String] = [
        "Start", "Workouts", "Coach", "Schedule", "Tasks", "Profile", "Settings", "God", "Create"
    ]
    var iconNames: [String] = [
        "play.circle.fill", "stopwatch.fill", "bubble.right.fill", "calendar.circle.fill", "bolt.horizontal.circle.fill", "person.circle.fill", "gear", "network", "pencil.circle.fill"
    ]
    
    var pages: [Page] = [
        .arcDetail,
        .workouts,
        .coachChat,
        .schedule,
        .tasks,
        .profile,
        .profile,
        .explore,
        .workoutGen
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
            ShortcutsHeader()
                .padding(.horizontal, 16)
                .padding(.top, 4)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(0..<iconNames.count, id: \.self) { index in
                        NewAppIcon(iconName: iconNames[index], appName: appNames[index], destination: pages[index], viewRouter: autopilotViewRouter)
                                            
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
        BottomSheet(searchText: .constant(""), offset: .constant(0), autopilotViewRouter: AutopilotViewRouter(), value: 0)
    }
}

