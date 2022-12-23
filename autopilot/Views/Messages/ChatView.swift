//
//  ChatView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/28/22.
//

import SwiftUI

struct ChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State private var showTimestamps = false
    @State private var keyboardHeight: CGFloat = 0


    @State var messageText: String = ""
    
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }

    var body: some View {
        
                VStack {
                    
                    ScrollViewReader { scrollView in
                            ScrollView {
                                VStack(alignment: .leading, spacing: 12) {
                                    ForEach(viewModel.messages, id: \.id) { message in
                                        MessageView(viewModel: viewModel, showTimestamps: $showTimestamps, message: message)
                                    }
                                    
                                }
                                .offset(y: -self.keyboardHeight)

                            }

                            .onAppear {
                                // Find the latest message
                                guard let latestMessage = viewModel.messages.last else { return }

                                // Scroll to the corresponding MessageView
                                scrollView.scrollTo(latestMessage.id)
                            }
                            .onChange(of: viewModel.messages) { messages in
                                // Find the latest message
                                guard let latestMessage = messages.last else { return }

                                // Scroll to the corresponding MessageView
                                scrollView.scrollTo(latestMessage.id)
                            }
                        MessageInputView(messageText: $messageText, keyboardHeight: $keyboardHeight, action: sendMessage)
                            .padding()
                        }
                   
                    
                        
                    
                }
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    self.keyboardHeight = 0
                }
                .navigationTitle(user.username)
            .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onChanged { value in
                    print(value.translation)
                    switch(value.translation.width, value.translation.height) {
                        case (...0, -30...30):
                        // left
                        if self.showTimestamps == false {
                            self.showTimestamps.toggle()
                        }
                        case (0..., -30...30):
                        // right
                        if self.showTimestamps == true {
                            self.showTimestamps.toggle()
                        }
                        case (-100...100, ...0):  print("up swipe")
                        case (-100...100, 0...):  print("down swipe")
                        default:  print("no clue")
                    }
                }
            )
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
