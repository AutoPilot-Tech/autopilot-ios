//
//  NotificationNumLabel.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/29/22.
//

import SwiftUI

struct NotificationNumLabel : View {
@Binding var number : Int
var body: some View {
ZStack {
Circle().fill(Color.red).frame(width: 20 * CGFloat(numOfDigits()), height: 20, alignment: .topTrailing).position(CGPoint(x: 65, y: 5))
Text("\(number)")
.foregroundColor(Color.white)
.font(Font.system(size: 12).bold()).position(CGPoint(x: 65, y: 5))
}
}
func numOfDigits() -> Float {
let numOfDigits = Float(String(number).count)
return numOfDigits == 1 ? 1.5 : numOfDigits
}
}

struct NotificationNumLabel_Previews: PreviewProvider {
    static var previews: some View {
        NotificationNumLabel(number: .constant(1))
    }
}
