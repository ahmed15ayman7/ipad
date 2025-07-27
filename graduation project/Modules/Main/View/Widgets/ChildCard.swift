//
//  ChildCard.swift
//  graduation project
//
//  Created by mazen eldeeb on 02/10/2024.
//

import SwiftUI

struct ChildCard: View {
    let child: User

    var body: some View {
        HStack {
            Image("Child")
                .frame(width: 80, height: 80)
                .padding(30)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .padding(3)
                .background(.notSelected)
                .clipShape(Circle())
            VStack {
                Text(child.name)
                    .font(.system(size: 20))
                    .foregroundStyle(.text)
                Text("Level 1")
                    .font(.system(size: 15))
                    .foregroundStyle(.text)
            }
            .padding(.leading)
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 13, height: 20)
                .foregroundStyle(.mainRed)
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    ChildCard(child: User(uid: "", email: "", name: "Dania", accountType: .child, password: ""))
}
