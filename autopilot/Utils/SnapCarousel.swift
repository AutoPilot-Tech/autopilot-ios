//
//  SnapCarousel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import SwiftUI

//struct SnapCarousel<Content: View, T: Identifiable: View {
//    var content: (T) -> ContentSizeCategory
//    var list: [T]
//    
//    
//    // Properties
//    var spacing: CGFloat
//    var trailingSpace: CGFloat
//    @Binding var index: Int
//    
//    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T]){
//        self.list = items
//        self.spacing = spacing
//        self.trailingSpace = trailingSpace
//        self._index = index
//        self.content = content
//    }
//    
//    
//    var body: some View{
//        GeometryReader{proxy in
//            content
//        }
//    }
//}
//
//struct SnapCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        SnapCarousel()
//    }
//}
