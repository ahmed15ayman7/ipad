//
//  FinishAddChild.swift
//  graduation project
//
//  Created by mazen eldeeb on 01/10/2024.
//

import SwiftUI

struct FinishAddChild: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    let name: String
    let email: String
    let password: String
    @State var isLoading = false
    @State var navToMain = false
    @State private var showAlert = false
    
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
                Spacer()
                LoginCard(name: name, email: email, password: password)
                Spacer()
                RedButton(action: createChild, title: "Finish")
                Spacer()
            }
            .padding()
            .overlay {
                if isLoading {
                    ProgressView()
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(authViewModel.errorMessage ?? "An unknown error occurred"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationDestination(isPresented: $navToMain, destination: {
                MainView()
            })
        }
        .toolbar(.hidden)
    }
    
    func createChild() {
        Task {
            isLoading = true
            authViewModel.createChildProfile(name: name, email: email, password: password)
            isLoading = false
            if authViewModel.hasError {
                showAlert = true
            } else {
                navToMain = true
            }
        }
    }
}

#Preview {
    FinishAddChild(name: "", email: "", password: "")
}
