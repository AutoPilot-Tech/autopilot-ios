//
//  ArcCell.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Kingfisher

struct ArcCell: View {
    
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 12) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 56, height: 56)
                        .cornerRadius(56 / 2)
                        .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Matthew Molinar")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Text("@ergwrg •")
                                .foregroundColor(.gray)
                            
                            
                        }
                        
                        Text("Hi")
                            .foregroundColor(.black)
                    }
                }
                .padding(.bottom)
                .padding(.trailing)
                
//                ArcActionsView(arc: arc)
                
                Divider()
            }
            .padding(.leading, -16)
        }
}

//struct ArcCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ArcCell(arc: )
//    }
//}