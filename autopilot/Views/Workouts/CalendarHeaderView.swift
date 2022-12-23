//
//  CalendarHeaderView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI

struct CalendarHeaderView: View {
    var body: some View {
        HStack {
            ForEach(0..<7) { index in
                VStack {
                    Circle()
                        .strokeBorder(.gray, lineWidth: 2)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Text(self.dayOfWeek(for: index))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        )
                        .foregroundColor(.white)
                        

                }
            }
        }
    }

    func dayOfWeek(for index: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEEE"
        let date = Calendar.current.date(byAdding: .day, value: index, to: startOfWeek())!
        return formatter.string(from: date)
    }

    func startOfWeek() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        return calendar.date(from: components)!
    }

    
}

struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeaderView()
    }
}
