//
//  ChooseView.swift
//  graduation project
//
//  Created by mazen eldeeb on 04/09/2024.
//

import SwiftUI

struct ChooseView: View {
    @State private var isPresented: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        VStack {
            Spacer()
            Text("who are you?")
                .font(.system(size: 45))
                .foregroundStyle(.text)
            Group {
                Text("Signup as a ") +
                Text("Parent")
                    .bold()
                    .foregroundColor(.red) +
                Text(" to create child account")
            }
            .foregroundStyle(Color.text)
            .font(.system(size: 15))
            .padding(.top, 4)
            Spacer()
                .frame(maxHeight: .infinity)
            HStack {
                AccountTypeChoice(image: "Parent",
                                  accountType: .parent, chosenType: $authViewModel.chosenType)
                AccountTypeChoice(image: "Child",
                                  accountType: .child, chosenType: $authViewModel.chosenType)
            }
            .padding(.horizontal)
            Spacer()
            ZStack {
                VStack {
                    Spacer()
                    Image("Blob")
                        .resizable()
                        .frame(maxHeight: 300)
                        .edgesIgnoringSafeArea(.all)
                        .offset(y: 100)

                }
                RedButton(action: {
                    isPresented = true
                }, title: "Login")
                .navigationDestination(isPresented: $isPresented, destination: {
                    if authViewModel.chosenType == .parent {
                        SignupScreen()
                    } else {
                        LoginView()
                    }
                })
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundWhite)
    }
}

#Preview {
    ChooseView()
}


