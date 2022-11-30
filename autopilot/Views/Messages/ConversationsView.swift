//
//  ConversationsView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI

struct ConversationsView: View {
    // state variable that determines if this view is presented or not
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State var user: User?
    @State var searchText = ""
    @ObservedObject var viewModel = ConversationsViewModel()
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = user {
                NavigationLink(destination: LazyView(ChatView(user: user)),
                               isActive: $showChat,
                               label: {})
            }
            
            ScrollView {
                SearchBar(text: $searchText, placeholder: "Search chats...")
                VStack {
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(destination: LazyView(ChatView(user: message.user)), label: {
                            ConversationCell(message: message)
                        })
                    }
                }.padding()
            }
            
            // toggle the state var
            Button(action: { self.isShowingNewMessageView.toggle() }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            // state var determines if this sheet is shown or not.
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat,
                                user: $user)
            })
        }
    }
}
