//
//  Arc.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import Firebase


struct Arc: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let description: String
    let uid: String
    let featuredImageUrl: String
    let timestamp: Timestamp
    let title: String
    
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.title = dictionary["title"] as? String ?? ""
    }
    
    var timestampString: String {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
            formatter.maximumUnitCount = 1
            formatter.unitsStyle = .abbreviated
            return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
        }
        
        var detailedTimestampString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a · MM/dd/yyyy"
            return formatter.string(from: timestamp.dateValue())
        }
}
