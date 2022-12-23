//
//  WorkoutCell.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI

struct WorkoutRowView: View {

    var body: some View {
        HStack {
            VStack {
                Text("Thu")
                Text("22")
            }.padding(.horizontal, 10)
            Divider()
            VStack {
                Text("Workout Name")
                    .font(.headline)
                Text("23 min")
                    .font(.subheadline)
            }.padding(.horizontal, 25)
            Spacer()
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
            }.padding(.horizontal, 25)
            
        }.padding()
    }
}

struct WorkoutRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRowView()
    }
}
