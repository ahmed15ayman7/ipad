//
//  LoginView.swift
//  graduation project
//
//  Created by mazen eldeeb on 05/09/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    var body: some View {
        ZStack {
            Color.backgroundWhite.ignoresSafeArea()
            VStack {
                Spacer()
                Image("Blob")
                    .offset(y: 100)
            }
            VStack(alignment: .leading ){
                HStack {
                    Spacer()
                    Image("LaunchScreen")
                        .resizable()
                        .frame(width: 100, height: 100)
                    .scaledToFill()
                    Spacer()
                }
                Rectangle()
                    .foregroundStyle(.notSelected)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .padding(.bottom, 50)
                Text("Log In")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(.mainRed)
                    .padding(.bottom, 16)
                Text("Welcome to FitQuest")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(red: 75/255, green: 87/255, blue: 104/255))
                    .padding(.bottom)
                LoginTextField(title: "Username", text: $username)
                LoginTextField(title: "Password", text: $username)

                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        RedButton(action: {}, title: "Login")
                        Spacer()
                    }
                    .padding(.vertical)
                    HStack {
                        Text("Don’t have an account?")
                        Button(action: {}, label: {
                            Text("Sign Up as a Parent")
                                .foregroundStyle(.mainRed)
                                .bold()
                        })
                    }
                    
                }
                Spacer()
               
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}


