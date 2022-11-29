//
//  SearchViewModel.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import Foundation
import Firebase

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        
    }
}
