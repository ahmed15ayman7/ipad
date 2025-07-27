//
//  ProfileView.swift
//  graduation project
//
//  Created by mazen eldeeb on 06/09/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var progress: CGFloat = 0.5
    var body: some View {
        ZStack {
            Color.backgroundWhite
            VStack {
                Image("UpperBlob")
                .ignoresSafeArea()
                Spacer()
            }.ignoresSafeArea()
            Image("MainBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Child")
                    .padding(30)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                   
                Text("\(authViewModel.name)")
                    .foregroundStyle(.text)
                    .bold()
                    .font(.system(size: 32))
                    .padding(.top, 8)
                Text("Level 1")
                    .foregroundStyle(.text)
                    .font(.system(size: 16))
                LevelProgressView(startValue: 500, endValue: 1000, progress: $progress)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                    .padding(.horizontal)
                
                ProfileButton(title: "Badges", destination: BadgesView(badges: Badge.sampleBadges ))
                    .padding(.top, 8)
                ProfileButton(title: "Login Card", destination: LoginCardsView())
                ProfileButton(title: "Logout", destination: IntroView(), textColor: .mainRed, signout: authViewModel.signOut)
                Spacer()
                
            }.padding()
            
            
            
        }
        
    }
}

#Preview {
    ProfileView()
}



struct ProfileButton<T: View>: View {
    let title: String
    let destination: T
    var textColor: Color?
    var signout: (() -> Void)?
    @State private var isActive: Bool = false
    
    var body: some View {
        Button(action: {
            signout?()
            isActive = true
        }, label: {
            HStack {
                Text(title)
                    .font(.system(size: 22))
                    .foregroundStyle(textColor ?? .text)
                Spacer()
                Text(">")
                    .foregroundStyle(.mainRed)
                    .bold()
                    .font(.system(size: 20))
            }
            .padding(8)
        })
        .navigationDestination(isPresented: $isActive) {
            destination
        }
    }
}

