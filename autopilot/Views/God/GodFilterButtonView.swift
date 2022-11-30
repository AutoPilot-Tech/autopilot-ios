//
//  GodFilterButtonView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

enum GodFilterOptions: Int, CaseIterable {
    case arcs
    case users
    
    var title: String {
        switch self {
        case .arcs: return "Arcs"
        case .users: return "Users"
        }
    }
}

struct GodFilterButtonView: View {
    @Binding var selectedOption:GodFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(GodFilterOptions.allCases.count)
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(GodFilterOptions.allCases.count)
        return (UIScreen.main.bounds.width / count * rawValue + 16)
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(GodFilterOptions.allCases, id: \.self) { option in
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

struct GodFilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GodFilterButtonView(selectedOption: .constant(.arcs))
    }
}
