//
//  ProfileViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Firebase


class ProfileViewModel: ObservableObject {
    let user: User
    @Published var userArcs = [Arc]()
    
    init(user: User) {
        self.user = user
        fetchUserArcs()
    }
    
    func fetchUserArcs() {
        COLLECTION_ARCS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            documents.forEach { document in
                print("DEBUG: Doc data is \(document.data())")
            }
        }
    }
    
    
}
