//
//  ArcCell.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Kingfisher

struct ArcCell: View {
    let arc: Arc
    
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: arc.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .cornerRadius(16)
                        
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(arc.fullname)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Text("@\(arc.username)")
                                .foregroundColor(.gray)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                            
                            
                        }
                        
                        Text(arc.title)
                            .foregroundColor(.black)
                    }
                }
                .padding(.bottom)
                .padding(.trailing)
                
//                ArcActionsView(arc: arc)
                
                Divider()
            }
            .padding(.horizontal)
            .padding(.leading, -16)
        }
}

//struct ArcCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ArcCell(arc: )
//    }
//}
