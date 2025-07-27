//
//  MainView.swift
//  graduation project
//
//  Created by mazen eldeeb on 06/09/2024.
//

import SwiftUI

struct MainView: View {
    @State var selectedView: TabBarViewTitle = .home
    @StateObject private var cameraManager = CameraManager.shared
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom)
            {
                if selectedView == .home {
                    HomeView()
                        .environmentObject(authViewModel)
                } else if selectedView == .quests {
                    QuestScreen()
                } else if selectedView == .myChildren {
                    MyChildrenView()
                        .environmentObject(authViewModel)
                } else if selectedView == .progress {
                    ProgressMainView()
                        .environmentObject(authViewModel)
                } else {
                    ProfileView()
                        .environmentObject(authViewModel)
                }
                
                GlobalTabBar(selection: $selectedView)
                    .environmentObject(authViewModel)
            }.navigationBarHidden(true)
        }
    }
}

#Preview {
    MainView()
}
