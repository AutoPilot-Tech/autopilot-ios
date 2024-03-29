//
//  LazyView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//


import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
