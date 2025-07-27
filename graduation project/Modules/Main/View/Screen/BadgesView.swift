//
//  BadgesView.swift
//  graduation project
//
//  Created by mazen eldeeb on 08/09/2024.
//

import SwiftUI

struct BadgesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let badges: [Badge]
    var body: some View {
        ZStack {
            Color.backgroundWhite.ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()

                    }, label: {
                       Image("Back")
                    })
                    Spacer()
                    Text("Badges")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                    .padding(.bottom)
                ScrollView {
                    LazyVStack {
                        ForEach(badges) { badge in
                            BadgeCard(badge: badge)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }.padding(.horizontal)
        }.toolbar(.hidden)
            .swipeToGoBack()
        
    }
}



#Preview {
    BadgesView(badges: Badge.sampleBadges)
}

extension View {
    func swipeToGoBack() -> some View {
        self.modifier(SwipeToGoBackModifier())
    }
}

struct SwipeToGoBackModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: 20, coordinateSpace: .global)
                    .onChanged { value in
                        print(value)
                        guard value.startLocation.x < 20, value.translation.width > 45 else { return }
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }
            )
    }
}
