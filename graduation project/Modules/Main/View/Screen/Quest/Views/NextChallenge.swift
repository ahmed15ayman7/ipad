//
//  NextChallenge.swift
//  graduation project
//
//  Created by mazen eldeeb on 22/09/2024.
//

import SwiftUI

struct NextChallenge: View {
    @EnvironmentObject var questViewModel: QuestViewModel
    @State var navigateToNext = false
    var body: some View {
        ZStack {
            Color.backgroundWhite.ignoresSafeArea()
            VStack {
                Spacer()
                Image("Blob")
                    .offset(y: 100)
            }
            VStack {
                Text("iPad challenge 🎉")
                    .font(.system(size: 36))
                    .foregroundStyle(.text)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                Spacer()
                ZStack {
                    Image("BackgroundStar")
                        .resizable()
                        .frame(width: 300, height: 300)
                    VStack {
                        Text("YES!")
                        Text("Good Job")
                    }
                    .font(.system(size: 27))
                    .foregroundStyle(.text)
                }
                Text("Go to the next one, you can do this")
                    .font(.system(size: 15))
                    .foregroundStyle(.text)
                Spacer()
                RedButton(action: {
                    navigateToNext = true
                }, title: "Next Exercise")
                .navigationDestination(isPresented: $navigateToNext, destination: {
                    IntroChallengeScreen()
                        .environmentObject(questViewModel)
                })
            }
            .padding()
        }
        .onAppear {
            questViewModel.currentIndex += 1
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NextChallenge()
}
