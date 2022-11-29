//
//  User.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import Foundation


struct User: Identifiable {
    let id: String
    let username: String
    let fullname: String
    let email: String
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
    }
}