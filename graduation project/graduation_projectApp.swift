//
//  graduation_projectApp.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import SwiftUI

@main
struct graduation_projectApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            if authViewModel.isSignedIn {
                MainView()
                    .environmentObject(authViewModel)
            } else {
                IntroView()
                    .environmentObject(authViewModel)
            }
           
        }
    }
}
