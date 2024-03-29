//
//  AuthViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth


class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @EnvironmentObject var viewModel: AuthViewModel
    @Published var user: User?
    @Published var isAdmin = false
    
    static let shared = AuthViewModel() // share the user property across the application
    
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
        
    }
    
    func login(withEmail email:String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
            
        }
    }
    
    //
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
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: failed to upload image: \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username.lowercased(),
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: Uploading data...")
                        self.userSession = user
                        self.fetchUser()
                        
                    }
                    
                }
            }
        }
        
        
        
        

    }
    
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        print("DEBUG: User is \(uid)")
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to get user from firebase: \(error.localizedDescription)")
                return
            }
            guard let data = snapshot?.data() else { return }
            self.isAdmin = data["isAdmin"] as? Bool ?? false
            self.user = User(dictionary: data)
        }
    }
}



