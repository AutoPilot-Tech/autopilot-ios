//
//  WorkoutsView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI

struct WorkoutsView: View {

    var body: some View {
        VStack {
            CalendarHeaderView()
                .padding(.top, 20)
            List {
                ForEach(0..<10) {_ in
                    WorkoutRowView()
                }
            }
        }
    }
}








struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}
