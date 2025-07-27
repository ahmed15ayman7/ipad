//
//  GlobalTabBar.swift
//  graduation project
//
//  Created by mazen eldeeb on 05/09/2024.
//

import SwiftUI

struct GlobalTabBar: View {
    @EnvironmentObject var user: AuthViewModel
    @Binding var selection: TabBarViewTitle
    
    var body: some View {
        HStack {
            TabBarItem(value: .home, selectedView: $selection)
            if user.chosenType == .parent {
                TabBarItem(value: .myChildren, selectedView: $selection)
            } else {
                TabBarItem(value: .quests, selectedView: $selection)
            }
            TabBarItem(value: .progress, selectedView: $selection)
            TabBarItem(value: .profile, selectedView: $selection)
            
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


#Preview {
    GlobalTabBar(selection: .constant(.home))
}


struct TabBarItem: View {
    let value: TabBarViewTitle
    @Binding var selectedView: TabBarViewTitle
    var image: String {
        switch value {
        case .home:
            return "FitQuest"
        case .profile:
            return "person.crop.circle"
        case .progress:
            return "Progress"
        case .quests:
            return "Star"
        case .myChildren:
            return "MyChildren"
        }
    }
    var body: some View {
        Button(action: {
            withAnimation {
                selectedView = value
            }
        }, label: {
            VStack(spacing: 2) {
                if value == .profile {
                    Image(systemName: image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(selectedView == value ? .mainRed : .gray)
                    
                } else {
                    Image(selectedView == value ? "\(image)Active" : image)
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                
                Text(value.rawValue).foregroundStyle(selectedView == value ? .mainRed : .gray)
            }.padding()
        })
    }
}
