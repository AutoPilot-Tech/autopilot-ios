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
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<100) { _ in
                        ArcCell()
                    }
                }
            }
        }
    }
}
