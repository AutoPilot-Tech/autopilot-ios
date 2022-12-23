//
//  MesageInputView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    @Binding var keyboardHeight: CGFloat

    
    var action: () -> Void
    
    var body: some View {
        HStack {
            TextField("autoMessage", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
                        self.keyboardHeight = keyboardHeight
                    }
                }
                .onDisappear {
                    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                }
            
            Button(action: action) {
//                Text("Send")
//                    .bold()
//                    .foregroundColor(.blue)
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)
            }
        }
    }
}

