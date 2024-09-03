//
//  RedButton.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import SwiftUI

struct RedButton: View {
    let action: () -> Void
    let title: String
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: 20))
                .bold()
                .padding(.horizontal, 40)
                .padding(.horizontal, 8)
        })
        .buttonStyle(.borderedProminent)
        .tint(.mainRed)
        .foregroundStyle(.white)
    }
}

#Preview {
    RedButton(action: {}, title: "Login")
}
