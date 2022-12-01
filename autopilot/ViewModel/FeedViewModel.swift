//
//  FeedViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    @Published var arcs = [Arc]()
    
    
    init() {
        fetchArcs()
    }
    
    func fetchArcs() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query =  COLLECTION_ARCS
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let data = change.document.data()
                self.arcs.append(Arc(dictionary: data))
            }
            
        }
//        COLLECTION_ARCS.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.arcs = documents.map({ Arc(dictionary: $0.data())})
//        }
    }
}
