//
//  CarouselViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/30/22.
//

import Foundation
import SwiftUI


class CarouselViewModel: ObservableObject {
    @Published var arcs = [Arc]()
    
    
    init() {
        fetchArcs()
    }
    
    func fetchArcs() {
        COLLECTION_ARCS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.arcs = documents.map({ Arc(dictionary: $0.data())})
        }
    }
}
