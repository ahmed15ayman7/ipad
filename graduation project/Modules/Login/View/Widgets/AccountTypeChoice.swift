//
//  AccountTypeChoice.swift
//  graduation project
//
//  Created by mazen eldeeb on 04/09/2024.
//

import SwiftUI

struct AccountTypeChoice: View {
    let image: String
    let accountType: AccountType
    @Binding var chosenType: AccountType
    
    var body: some View {
        Button(action: {
            chosenType = accountType
        }, label: {
            VStack {
                Image(image)
                    .frame(width: 140, height: 140)
                       .padding()
                       .background(.notSelected.opacity(0.4))
                       .clipShape(RoundedRectangle(cornerRadius: 16))
                       .overlay(
                            accountType == chosenType ?
                           RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.mainRed, lineWidth: 2) : nil
                       )
                Text(image)
                    .foregroundStyle(.text)
                    .font(.system(size: 22))
            }
           
        })
    }
}

#Preview {
    AccountTypeChoice(image: "Parent", accountType: .child, chosenType: .constant(.child))
}
