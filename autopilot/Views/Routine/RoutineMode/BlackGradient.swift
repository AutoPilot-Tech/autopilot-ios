//
//  BlackGradient.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/30/22.
//

import SwiftUI

struct BlackGradient: View {
  var body: some View {
      LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .center)
      .edgesIgnoringSafeArea(.all)
  }
}

struct BlackGradient_Previews: PreviewProvider {
    static var previews: some View {
        BlackGradient()
    }
}
