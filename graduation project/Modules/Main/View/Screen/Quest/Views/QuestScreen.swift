//
//  QuestScreen.swift
//  graduation project
//
//  Created by mazen eldeeb on 20/09/2024.
//

import SwiftUI

struct QuestScreen: View {
    @StateObject var questViewModel: QuestViewModel = QuestViewModel()

    @State private var navigateToChallenge = false
    
    var body: some View {
        ZStack {
            Color.backgroundWhite
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("Blob")
                    .offset(y: 100)
            }
            VStack(alignment: .leading) {
                Text("Quests")
                    .font(.system(size: 35))
                    .foregroundStyle(.text)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                VStack(alignment: .center, spacing: 20) {
                    Text("ends in 14 days")
                        .foregroundStyle(.text)
                        .font(.system(size: 10))
                    Text("iPad challenge 🎉")
                        .foregroundStyle(.text)
                        .font(.system(size: 20))
                    HStack(spacing: 0) {
                        Text("Submitted by")
                            .foregroundStyle(.text)
                            .font(.system(size: 10))
                        Text(" Hanan")
                            .foregroundStyle(.text)
                            .font(.system(size: 10))
                            .bold()
                    }
                    Spacer()
                    ZStack {
                        Image("BackgroundStar")
                        Image("elephant")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    Spacer()
                    RedButton(action: {
                        navigateToChallenge = true
                    }, title: "Start Day 7")
                    .navigationDestination(isPresented: $navigateToChallenge, destination: {
                        IntroChallengeScreen()
                            .environmentObject(questViewModel)
                    })
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.top, 16)
                .padding(.bottom, 100)
            }
            .padding()
        }
    }
}

#Preview {
    QuestScreen()
}
