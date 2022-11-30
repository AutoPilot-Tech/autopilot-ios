//
//  NewArcView.swift
//  autopilot
//
//  Created by Matthew Molinar on 11/29/22.
//

import SwiftUI
import Kingfisher

struct NewArcView: View {
    @Binding var isPresented: Bool
    @State var titleText: String = ""
    @ObservedObject var viewModel: UploadArcViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadArcViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    
                    
                    TextArea("What Arc are you in?", text: $titleText)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: { isPresented.toggle() }) {
                    Text("Cancel")
                        .foregroundColor(.blue)
                },
                                    trailing: Button(action: {
                    viewModel.uploadArc(title: titleText)
                }) {
                    Text("Continue")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                )
                Spacer()
            }
        }
    }
}

