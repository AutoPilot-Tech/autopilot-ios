//
//  MessageView.swift
//  ProfileUserPath
//
//  Created by Matthew Molinar on 11/27/22.
//

import SwiftUI
import Kingfisher
import UIKit


struct LastMessageHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct MessageView: View {
    @ObservedObject var viewModel: ChatViewModel
    @Binding var chatBlurAmount: Double
    @State private var height: CGFloat = 0

    @Binding var showTimestamps: Bool
    let message: Message
    
    var body: some View {
        HStack {
            
            if message.isFromCurrentUser {
                Spacer()
                VStack(alignment: .trailing) {
                    if containsAtMostThreeEmojis(message: message.text) {
                        Text(message.text)
                            .background(GeometryReader { geo in
                                            Color.clear.preference(key: LastMessageHeightPreferenceKey.self, value: geo.frame(in: .global).midY)
                                        })
                            .font(.custom("Arial", size: 56))
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
                    } else {
                        Text(message.text)
                            .background(GeometryReader { geo in
                                            Color.clear.preference(key: LastMessageHeightPreferenceKey.self, value: geo.frame(in: .global).midY)
                                        })
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
                if containsAtMostThreeEmojis(message: message.text) {
                    HStack {
                        KFImage(URL(string: message.user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text(message.text)
                            .background(GeometryReader { geo in
                                            Color.clear.preference(key: LastMessageHeightPreferenceKey.self, value: geo.frame(in: .global).midY)
                                        })
                            .font(.custom("Arial", size: 56))
                            .padding(.horizontal)
                        Spacer()
                        Text(FORMATTED_TIMESTAMP(timestamp: message.timestamp))
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .opacity(showTimestamps ? 1 : 0)
                            .padding(.horizontal, -16)

                        
                        
                    }.padding(.horizontal)
                } else {
                    HStack {
                        KFImage(URL(string: message.user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text(message.text)
                            .background(GeometryReader { geo in
                                            Color.clear.preference(key: LastMessageHeightPreferenceKey.self, value: geo.frame(in: .global).midY)
                                        })
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(ChatBubble(isFromCurrentUser: false))
                            .foregroundColor(.black)
                        Spacer()
                        Text(FORMATTED_TIMESTAMP(timestamp: message.timestamp))
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .opacity(showTimestamps ? 1 : 0)
                            .padding(.horizontal, -16)
                            
                        
                    }.padding(.horizontal)
                }
                
                Spacer()
            }
            
        }
        .gesture(
            LongPressGesture()
                .onEnded { _ in
                    self.chatBlurAmount = 5.0
                    let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
                    impactFeedbackGenerator.prepare()
                    impactFeedbackGenerator.impactOccurred()
                }
        )
    }
}

