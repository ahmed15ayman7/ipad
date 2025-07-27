//
//  LoginTextField.swift
//  graduation project
//
//  Created by mazen eldeeb on 05/09/2024.
//

import SwiftUI

struct LoginTextField: View {
    let title: String
    var isSecure: Bool? = nil
    let keyboardType: UIKeyboardType
    @Binding var text: String
    @FocusState.Binding var focusedField: FieldType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color(red: 32/255, green: 32/255, blue: 32/255))
                .font(.system(size: 18))
            Group {
                if isSecure == true {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                        .keyboardType(keyboardType)
                }
            }
            .placeholder(
                Text(title).foregroundStyle(.gray), show: text.isEmpty)
            .foregroundStyle(.text)
            .padding()
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(8)
            .focused($focusedField, equals: focusedField)
        }
        .padding(.bottom)
    }
}
