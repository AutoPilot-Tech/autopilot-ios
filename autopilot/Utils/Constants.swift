//
//  Constants.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import Foundation
import Firebase
let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_ARCS = Firestore.firestore().collection("arcs")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
let coachMatthewData = ["email": "matthew.a.molinar@gmail.com",
            "username": "matthew",
            "fullname": "Matthew Molinar",
            "profileImageUrl": "https://firebasestorage.googleapis.com:443/v0/b/autopilotswiftui.appspot.com/o/1095C733-1515-4F5B-AD13-1382A1BAA125?alt=media&token=4067d247-f79f-475e-ba43-b82afee78cd9",
            "uid": "Ky4rb5JHKxZaj5LsLc36lHCJ3DG2"]
let COACH_MATTHEW = User(dictionary: coachMatthewData)

let FAKE_DATA = ["email": "fake@email.com",
            "username": "error",
            "fullname": "error",
            "profileImageUrl": "error",
            "uid": "error"]

func FORMATTED_TIMESTAMP(timestamp: Timestamp) -> String {
    let date = timestamp.dateValue()

    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short

    let formattedTimestamp = dateFormatter.string(from: date)
    return formattedTimestamp

}

extension String {

    func containsEmoji() -> Bool {
        
        for character in self {
            var shouldCheckNextScalar = false
            for scalar in character.unicodeScalars {
               if shouldCheckNextScalar {
                    if scalar == "\u{FE0F}" { // scalar that indicates that character should be displayed as emoji
                        return true
                    }
                    shouldCheckNextScalar = false
                }
                
                if scalar.properties.isEmoji {
                    if scalar.properties.isEmojiPresentation {
                        return true
                    }
                    shouldCheckNextScalar = true
                }
            }
        }
        
        return false
    }
    
    func containsAllEmojis() -> Bool {
        for character in self {
            for scalar in character.unicodeScalars {
                if scalar.properties.isEmoji == false {
                    return false
                }
            }
        }
        return true
    }
    
}


func containsAtMostThreeEmojis(message: String) -> Bool {
    return message.count <= 3 && message.containsAllEmojis()
    
    
}





