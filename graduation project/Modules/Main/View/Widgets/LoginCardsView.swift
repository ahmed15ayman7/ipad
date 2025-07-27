//
//  LoginCardsView.swift
//  graduation project
//
//  Created by mazen eldeeb on 10/09/2024.
//

import SwiftUI

struct LoginCardsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                   Image("Back")
                })
                Spacer()
                Text("Badges")
                    .font(.title)
                    .bold()
                Spacer()
            }
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(.notSelected)
                .padding(.bottom)
            LoginCard(name: "", email: "", password: "")
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .toolbar(.hidden)
        .padding()
        .background(.backgroundWhite)
    }
}

#Preview {
    LoginCardsView()
}
