//
//  ChildProfileScreen.swift
//  graduation project
//
//  Created by mazen eldeeb on 05/10/2024.
//

import SwiftUI

struct ChildProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var levelProgress: CGFloat = 500
    @State private var selectedTab = 0
    @State private var progress = 0.4
    let child: User

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
            VStack {
                VStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 23, height: 40)
                        }
                        Spacer()
                    }
                    Image("Child")
                        .padding(30)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        .padding(3)
                        .background(.mainRed)
                        .clipShape(Circle())
                    Text(child.name)
                        .foregroundStyle(.text)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(8)
                    Text("Level 1")
                        .foregroundStyle(.text)
                        .font(.system(size: 15))
                    LevelProgressView(startValue: 0, endValue: 1000, progress: $levelProgress)
                    HStack {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            Text("Quests")
                                .foregroundColor(selectedTab == 0 ? .white : .black)
                                .padding()
                                .background(selectedTab == 0 ? Color.mainRed : Color.notSelected)
                                .clipShape(Capsule())
                        }
                        
                        Button(action: {
                            selectedTab = 1
                        }) {
                            Text("Awards")
                                .foregroundColor(selectedTab == 1 ? .white : .black)
                                .padding()
                                .background(selectedTab == 1 ? Color.mainRed : Color.notSelected)
                                .clipShape(Capsule())
                        }
                    }
                    .background(Color(red: 254/255, green: 252/255, blue: 248/255))
                    .cornerRadius(25)
                    
                    TabView(selection: $selectedTab) {
                        QuestTabView()
                        .tag(0)
                        
                        Text("Awards")
                            .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 32))
            }.padding()
        }
        .navigationBarHidden(true)
    }
}

