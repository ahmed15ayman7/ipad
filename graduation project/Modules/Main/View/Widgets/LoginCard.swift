//
//  LoginCard.swift
//  graduation project
//
//  Created by mazen eldeeb on 10/09/2024.
//

import SwiftUI

struct LoginCard: View {
    let name: String
    let email: String
    let password: String
    var body: some View {
        VStack(alignment: .leading) {
            Image("LaunchScreen")
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.backgroundWhite)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.bottom, 20)
            Text(name)
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .padding(.bottom, 16)
            Text("Username:\(email)")
                .font(.system(size: 16))
                .foregroundStyle(.gray)
                .padding(.bottom, 6)
            Text("Password:\(password)")
                .font(.system(size: 16))
                .foregroundStyle(.gray)
            HStack {
                Image("Download")
                Spacer()
                Image("AppleWallet")
            }
            .padding(.top, 20)
            .padding(.horizontal)
        }
        .padding(24)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}

#Preview {
    LoginCard(name: "", email: "", password: "")
}
