//
//  MesageInputView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct KeyBoardHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct MessageInputView: View {
    @ObservedObject var viewModel: ChatViewModel

    @Binding var messageText: String
    @Binding var keyboardHeight: CGFloat

    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                            // Add your camera button action here
                        }) {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
            
            TextField("Type your message here...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.gray.opacity(0.1))
                )
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                        // calculate the bottom edge of last message
                        
                        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
                        self.keyboardHeight = keyboardHeight
                    }
                }
                .onDisappear {
                    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                }
            
            Button(action: {
                if messageText != "" {
                    action()
                } else {
                    print("DEBUG: Attempted to send an empty message, but it failed.")
                }
            }) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)
            }
        }
    }
}

