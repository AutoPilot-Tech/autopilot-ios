//
//  Handle.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct Handle : View {
    private let handleThickness = CGFloat(5.0)
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.gray)
            .padding(5)
    }
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Handle()
    }
}

