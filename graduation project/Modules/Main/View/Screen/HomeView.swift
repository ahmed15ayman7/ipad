//
//  HomeView.swift
//  graduation project
//
//  Created by mazen eldeeb on 07/09/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        ZStack {
            Color.backgroundWhite.ignoresSafeArea()
            VStack {
                Spacer()
                Image("Blob")
                    .resizable()
                    .frame(maxHeight: 300)
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: 100)
            }
            VStack(alignment: .leading) {
                Text("Hey, \(authViewModel.name)")
                    .font(.system(size: 36))
                    .foregroundStyle(.text)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                Text("Current Quest")
                    .font(.system(size: 20))
                    .foregroundStyle(.text)
                    .padding(.vertical)
                Image("Home")
                Text("Progress")
                    .font(.system(size: 20))
                    .padding(.vertical)
                    .foregroundStyle(.text)
                HStack {
                    ProgressCard(
                        title: "Quest Completion", child: CircularProgressView(progress: 0)
                            .frame(width: 100).padding(.top),
                        color: .mainRed
                    )
                    ProgressCard(
                        title: "Quest Completion", child: CircularProgressView(progress: 0)
                            .frame(width: 100).padding(.top),
                        color: .mainRed
                    ).hidden()
                }
                Spacer()
            }.padding()
        }
      
    }
}

#Preview {
    HomeView()
}
