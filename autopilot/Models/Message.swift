//
//  Message.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import Foundation
import Firebase


struct Message: Identifiable, Hashable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    let status: String
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    
    var chatPartnerId: String { return isFromCurrentUser ? toId: fromId }
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
        self.status = dictionary["status"] as? String ?? ""
    }
}



struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
    
    
}



let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "batman", messageText: "Hey what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "ProfilePic", messageText: "nm u??", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "...", isCurrentUser: false),
    .init(id: 3, imageName: "ProfilePic", messageText: "sooo?", isCurrentUser: true),
    .init(id: 4, imageName: "batman", messageText: "I'm batman.", isCurrentUser: false),
    .init(id: 5, imageName: "ProfilePic", messageText: "u literlly texted me..", isCurrentUser: true),
]
