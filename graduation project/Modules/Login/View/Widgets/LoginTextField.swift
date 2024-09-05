//
//  LoginTextField.swift
//  graduation project
//
//  Created by mazen eldeeb on 05/09/2024.
//

import SwiftUI

struct LoginTextField: View {
    let title: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                .font(.system(size: 18))
            TextField(title, text: $text)
                .padding()
                .frame(height: 50)
                .background(.white)
                .cornerRadius(8)
        }.padding(.bottom)
    }
}

#Preview {
    LoginTextField(title: "Username", text: .constant(""))
}
