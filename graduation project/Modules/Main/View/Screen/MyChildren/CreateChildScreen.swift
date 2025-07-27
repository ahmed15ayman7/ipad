//
//  CreateChildScreen.swift
//  graduation project
//
//  Created by mazen eldeeb on 01/10/2024.
//

import SwiftUI

struct CreateChildScreen: View {
    @State private var isMale: Bool = true
    @FocusState private var current: FieldType?
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var navToNext = false
    
    var body: some View {
        ZStack {
            Color.backgroundWhite.ignoresSafeArea()
            VStack {
                Spacer()
                Image("Blob")
                    .resizable()
                    .frame(maxHeight: 300)
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: 100)
            }
            VStack {
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 20, height: 40)
                    }
                    Spacer()
                    Text("Add Child")
                        .font(.system(size: 27))
                        .foregroundStyle(.text)
                    Spacer()
                }
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                Spacer()
                HStack {
                    ChildImage(male: true,image: "Child", isMale: $isMale)
                    ChildImage(male: false, image: "Female", isMale: $isMale)
                    
                }
                LoginTextField(
                    title: "Name",
                    keyboardType: .alphabet,
                    text: $name,
                    focusedField: $current
                )
                LoginTextField(
                    title: "Email",
                    keyboardType: .emailAddress,
                    text: $email,
                    focusedField: $current
                )
                LoginTextField(
                    title: "Password",
                    isSecure: true,
                    keyboardType: .alphabet,
                    text: $password,
                    focusedField: $current
                )
                Spacer()

                RedButton(action: {
                    navToNext = true
                }, title: "Next")
                Spacer()
            }
            .padding()
        }.toolbar(.hidden)
            .navigationDestination(isPresented: $navToNext, destination: {
                FinishAddChild(name: name, email: email, password: password)
            })
    }
}
#Preview {
    CreateChildScreen()
}
