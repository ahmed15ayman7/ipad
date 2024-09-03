//
//  ChooseView.swift
//  graduation project
//
//  Created by mazen eldeeb on 04/09/2024.
//

import SwiftUI

struct ChooseView: View {
    @StateObject private var viewModel = LoginViewModel()
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
            }.font(.system(size: 15))
                .padding(.top, 4)
            Spacer()
                .frame(maxHeight: .infinity)
            HStack {
                AccountTypeChoice(image: "Parent",
                                  accountType: .parent, chosenType: $viewModel.chosenType)
                AccountTypeChoice(image: "Child",
                                  accountType: .child, chosenType: $viewModel.chosenType)
            }.padding(.horizontal)
            Spacer()
            ZStack {
                VStack {
                    Spacer()
                    Image("Blob")
                        .offset(y: 100)
                }
                RedButton(action: {}, title: "Login")
               
            }
           
        }.background(.backgroundWhite)
    }
}

#Preview {
    ChooseView()
}


