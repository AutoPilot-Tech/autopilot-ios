//
//  RegistrationView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/29/22.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                
                Image("owl_2")
                    .resizable()
                    .background(Color.black.opacity(0))
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 220)
                    .padding(.bottom)
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .background(Color(.init(white: 0,alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .background(Color(.init(white: 0,alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "envelope")
                        .background(Color(.init(white: 0,alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .background(Color(.init(white: 0,alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.vertical)
                        .foregroundColor(.white)
                }
                .padding(.top, 100)
                .padding(.horizontal, 32)
                
                
                Button(action: {}, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.purple)
                        .cornerRadius(25)
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss()}, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                            
                    }
                    .foregroundColor(.blue)
                    .padding(.bottom, 150)
                })
                
                Spacer()
               
                
                    
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}