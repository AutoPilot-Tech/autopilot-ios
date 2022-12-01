//
//  FeedView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//
//ONLY FOR GOD MODE FOR NOW




import SwiftUI

// ONLY FOR GOD MODE. Employees and VIP only.
struct FeedView: View {
    @State var isSHowingNewArcView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(viewModel.arcs) { arc in
                        NavigationLink(destination: ArcDetailView(arc: arc)) {
                            ArcCell(arc: arc)
                        }
                    }
                }
                .padding()
            }
            
            Button(action: { isSHowingNewArcView.toggle() }, label: {
                Image(systemName: "plus")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 28, height: 28)
                                .padding()
                        })
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .padding()
                        .fullScreenCover(isPresented: $isSHowingNewArcView) {
                            NewArcView(isPresented: $isSHowingNewArcView)
                        }
//
            
        }
    }
}
