//
//  HomeView.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/23/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var autopilotViewRouter: AutopilotViewRouter
    @Binding var slideTabShowing: Bool
    var body: some View {
        VStack {
            CarouselView(itemHeight: 400, views: [
            AnyView(
                
                MadeForYou().onTapGesture {
                    slideTabShowing = false
                    autopilotViewRouter.currentPage = .arcDetail
                }

                

                ),
            AnyView(
                
                MadeForYou().onTapGesture {
                    slideTabShowing = false
                    autopilotViewRouter.currentPage = .arcDetail
                }

                

                ),                                AnyView(ArcCardContent()),
            AnyView(
                
                MadeForYou().onTapGesture {
                    slideTabShowing = false
                    autopilotViewRouter.currentPage = .arcDetail
                }

                

                )
        ])
           
        }
        
    }
}


