//
//  FilterButtonView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

enum AutopilotFilterOptions: Int, CaseIterable {
    case arcs
    case awards
    
    var title: String {
        switch self {
        case .arcs: return "Arcs"
        case .awards: return "Awards"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption:AutopilotFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(AutopilotFilterOptions.allCases.count)
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(AutopilotFilterOptions.allCases.count)
        return (UIScreen.main.bounds.width / count * rawValue + 16)
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(AutopilotFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth - 4)
                    })
                }
            }
            Rectangle()
                .frame(width: underlineWidth - 24, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
                
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.awards))
    }
}
