//
//  AuthViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Firebase
import FirebaseAuth


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    
    init() {
        userSession = Auth.auth().currentUser
        
    }
    
    func login(withEmail email:String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully logged in")
            
        }
    }
    
    //            guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
                
    //            let filename = NSUUID().uuidString
    //            let storageRef = Storage.storage().reference().child(filename)
    //            storageRef.putData(imageData, metadata: nil) { (_, error in
    //                                                            if let error = error {
    //                print("DEBUG: failed to upload image: \(error.localizedDescription)")
    //                return
    //            }
                
    //            storageRef.downloadURL {url, _ in
    //                guard let profileImageUrl = url?.absoluteString else { return }
    //            }
    //            )}
    
    func registerUser(email: String, password: String, username: String, fullname: String) {
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email,
                        "username": username,
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                print("DEBUG: Successfully uploaded user data...")
                
            }
            
        }
        
        

    }
}



