//
//  MyChildrenView.swift
//  graduation project
//
//  Created by mazen eldeeb on 30/09/2024.
//

import SwiftUI

struct MyChildrenView: View {
    @State private var navigateToCreateScreen = false
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
            VStack {
                HStack {
                    Text("My Children")
                        .font(.system(size: 36))
                        .foregroundStyle(.text)
                    Spacer()
                    Button {
                        navigateToCreateScreen = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                ScrollView {
                    LazyVStack {
                        ForEach(authViewModel.children, id: \.uid) { child in
                            NavigationLink(destination: ChildProfileScreen(child: child)) {
                                ChildCard(child: child)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .navigationDestination(isPresented: $navigateToCreateScreen, destination: {
                CreateChildScreen()
                    .environmentObject(authViewModel)
            })
        }
    }
}

#Preview {
    MyChildrenView()
}
