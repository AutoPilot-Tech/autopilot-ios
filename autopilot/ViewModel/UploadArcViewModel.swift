//
//  UploadArcViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Firebase

class UploadArcViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadArc(title: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_ARCS.document()
        
        let data: [String: Any] = ["uid": user.id, "title": title, "fullname": user.fullname, "timestamp": Timestamp(date: Date()), "username": user.username, "profileImageUrl": user.profileImageUrl, "id": docRef.documentID]
        
        docRef.setData(data) { _ in
            print("DEBUG: SUCCESSfully uploaded Arc")
            self.isPresented = false
            
        }
    }
    
}

