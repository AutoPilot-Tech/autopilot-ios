//
//  FeedViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

class FeedViewModel: ObservableObject {
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
