//
//  TasksView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/26/22.
//

import SwiftUI

struct TasksView: View {
    @State private var showInbox = true
    @State private var showToday = true
    @State private var showUpcoming = true
    @State private var showFavorites = true
    @State private var showProjects = true
    @State private var showNewProjectSheet = false
    
    var body: some View {
        List {
            
            NavigationLink(destination: TasksInboxView()) {
                HStack {
                    Image(systemName: "tray.fill")
                        .foregroundColor(.blue)
                    Text("Inbox")
                    Spacer()
                    Text("32")
                }
            }
            NavigationLink(destination: TasksTodayView()) {
                HStack {
                    Image(systemName: "01.square.fill")
                        .foregroundColor(.green)
                    Text("Today")
                    Spacer()
                    Text("7")
                    
                }
            }
            NavigationLink(destination: TasksUpcomingView()) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.purple)
                    Text("Upcoming")
                    Spacer()
                    Text("39")
                }
            }
            // Add a section for the "Favorites" projects
                            Section(header: FavoritesSectionHeader(title: "Favorites", isExpanded: $showFavorites)) {
                                if showFavorites {
                                    // Add a list of the user's favorite projects here
                                    ForEach(0..<5) { item in
                                        NavigationLink(destination: WorkoutsView()) {
                                            HStack {
                                                Circle()
                                                    .fill(Color.blue)
                                                    .frame(width: 10, height: 10)
                                                    
                                                Text("ME 366J")
                                                Spacer()
                                                Text("34")
                                                
                                            }
                                        }
                                    }
                                }
                            }
            
            // Add a section for all of the projects
            Section(header: ProjectsSectionHeader(title: "Projects", isExpanded: $showProjects, showNewProjectSheet: $showNewProjectSheet)) {
                                if showProjects {
                                    // Add a list of all of the projects here
                                    ForEach(0..<50) { item in
                                        NavigationLink(destination: WorkoutsView()) {
                                            HStack {
                                                Circle()
                                                    .fill(Color.blue)
                                                    .frame(width: 10, height: 10)
                                                    
                                                Text("ME 366J")
                                                Spacer()
                                                Text("34")
                                                
                                            }
                                        }
                                        .animation(.spring())
                                    }
                                }
                
                            }
                            
        }
        }
        
    }


struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}





