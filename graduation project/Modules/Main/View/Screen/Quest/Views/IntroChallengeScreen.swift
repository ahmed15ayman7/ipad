//
//  IntroChallengeScreen.swift
//  graduation project
//
//  Created by mazen eldeeb on 20/09/2024.
//

import SwiftUI

struct IntroChallengeScreen: View {
    @EnvironmentObject var questViewModel: QuestViewModel
    @State var navigateToChallenge = false
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
                Text(questViewModel.getCurrentExercise().name)
                    .font(.system(size: 30))
                    .foregroundStyle(.text)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.notSelected)
                    .clipShape(Capsule())
                    .padding(.top)
                Text("\(questViewModel.getCurrentExercise().numberOfSets) sets")
                    .font(.system(size: 20))
                    .foregroundStyle(.text)
                
                Spacer()
                
                Image(questViewModel.getCurrentExercise().image)
                
                Spacer()
                
                RedButton(action: {
                    navigateToChallenge = true
                }, title: "Start Exercise")
                .navigationDestination(isPresented: $navigateToChallenge, destination: {
                    ChallengeScreen()
                        .environmentObject(questViewModel)
                })
                
                Spacer()
                
            }
        }
        .onAppear {
            print(questViewModel.currentIndex)
        }
    }
}

#Preview {
    IntroChallengeScreen()
        .environmentObject(QuestViewModel())
}
