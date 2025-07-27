//
//  FinishWeekScreen.swift
//  graduation project
//
//  Created by mazen eldeeb on 22/09/2024.
//

import SwiftUI

struct FinishWeekScreen: View {
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Color.backgroundWhite.ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("Blob")
                        .offset(y: 100)
                }
                VStack {
                    Group {
                        Text("Yay!")
                        
                        Text("Day 7 is Completed")
                    }
                    .foregroundStyle(.text)
                    .font(.system(size: 25))
                    Spacer()
                    ZStack {
                        Image("BackgroundStar")
                            .resizable()
                            .frame(width: 300, height: 300)
                        Image("elephant")
                            .resizable()
                            .frame(width: 300, height: 300)
                    }
                    Spacer()
                    
                    RedButton(action: {
                        resetAndNavigateToHome()
                    }, title: "Finish Day 7")
                    .navigationDestination(for: String.self) { value in
                        switch value {
                        default:
                            MainView()
                        }
                        
                        
                    }.padding()
                }
        }
        
    }
    
    
}
private func resetAndNavigateToHome() {
    navigationPath.removeLast(navigationPath.count)
    navigationPath.append("MainView")
}
}

#Preview {
    FinishWeekScreen()
}
