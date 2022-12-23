//
//  MessageView.swift
//  ProfileUserPath
//
//  Created by Matthew Molinar on 11/27/22.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    @ObservedObject var viewModel: ChatViewModel

    @Binding var showTimestamps: Bool
    let message: Message
    
    var body: some View {
        HStack {
            
            if message.isFromCurrentUser {
                Spacer()
                VStack(alignment: .trailing) {
                    if containsAtMostThreeEmojis(message: message.text) {
                        Text(message.text)
                            .font(.custom("Arial", size: 56))
                            .padding(.horizontal)
                    } else {
                        Text(message.text)
                            .padding()
                            .background(Color.blue)
                            .clipShape(ChatBubble(isFromCurrentUser: true))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .offset(x: showTimestamps ? -60 : 0, y: 0)
                            .animation(.easeInOut)
                            .overlay(
                                        HStack {
                                            Spacer()
                                            Text(FORMATTED_TIMESTAMP(timestamp: message.timestamp))
                                                .font(.footnote)
                                                .foregroundColor(.gray)
                                                .padding(8)
                                                .opacity(showTimestamps ? 1 : 0)
                                        }
                        )
                        if message == viewModel.messages.last {
                            Text("Delivered")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 15)
                                .offset(x: showTimestamps ? -60 : 0, y: 0)
                            .animation(.easeInOut)
                        }
                    }
                    
                }
                
                
                
            } else {
                HStack {
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    
                }.padding(.horizontal)
                Spacer()
            }
            
        }
    }
}

