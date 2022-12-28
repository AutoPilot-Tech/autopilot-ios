//
//  DummyView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/28/22.
//

import SwiftUI


let colors: [Color] = [.red, .green, .blue, .yellow, .purple]

@ViewBuilder
func ColorView() -> some View {
   (colors.randomElement() ?? .gray)
       .cornerRadius(10)
       .frame(minHeight: 40)
}

struct DummyView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.fixed(150))]) {
                ForEach((0...250), id: \.self) { _ in
                    ColorView()
                }
            }
        }
        .padding()
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
