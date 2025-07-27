//
//  QuestTabView.swift
//  graduation project
//
//  Created by mazen eldeeb on 05/10/2024.
//

import SwiftUI

struct QuestTabView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Quest 1")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text("iPad challenge 🎉")
                    .font(.title2)
                    .bold()
                    .padding()
                Text("40%")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.mainRed)
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                    }) {
                        Image(systemName: "trash.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(.mainRed)
                            .clipShape(Circle())
                    }
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(.mainRed)
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
}

#Preview {
    QuestTabView()
}
