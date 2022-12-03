//
//  User.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import Foundation
import Firebase


struct User: Identifiable {
    let id: String
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
    let isCurrentUser: Bool
    let isAdmin: Bool
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.isCurrentUser = Auth.auth().currentUser?.uid == self.id
        self.isAdmin = dictionary["isAdmin"] as? Bool ?? false
    }
}
