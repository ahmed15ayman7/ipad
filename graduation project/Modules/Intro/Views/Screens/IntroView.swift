//
//  IntroView.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import SwiftUI

struct IntroView: View {
    @StateObject private var handler: Handler = .init()
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $handler.slideIndex) {
                    ForEach(handler.slides) { slide in
                        VStack {
                            SlideView(slide: slide)
                        }
                        .tag(slide.tag)
                    }
                }
                .animation(.easeInOut, value: handler.slideIndex)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                SlidesTracker(slideIndex: $handler.slideIndex, slidesCount: handler.slides.count)
                HStack {
                    Spacer()
                    Button(action: handler.goToNext, label: {
                        Text(handler.isLast ? "Next >" : "Skip >")
                            .foregroundStyle(.mainRed)
                            .bold()
                            .font(.system(size: 20))
                            .navigationDestination(
                                isPresented: $handler.navigateToNextView) {
                                    FinalIntroView()
                                }
                        
                    }).padding(.bottom, 50)
                    .padding(.horizontal, 30)
                   
                }
            }.background(
                Image("MainBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all))
            .background(.backgroundWhite)
            
        }
        
        
    }
}

#Preview {
    IntroView()
}


