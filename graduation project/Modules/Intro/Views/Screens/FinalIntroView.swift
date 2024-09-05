//
//  FinalIntroView.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import SwiftUI

struct FinalIntroView: View {
    var body: some View {
        ZStack {
            Color.backgroundWhite
           
            VStack {
                Spacer()
                Image("Blob").offset(y: 100)
                    
            }.ignoresSafeArea()
            Image("MainBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    Image("GraySine")
                    VStack {
                        Text("start your journey, and be ")
                            .font(.system(size: 25))
                            .foregroundStyle(.text)
                        Text("The Fittest")
                            .font(.system(size: 50))
                            .foregroundStyle(.text)
                            .bold()
                            .padding(.vertical)
                        Text("of them all")
                            .font(.system(size: 25))
                            .foregroundStyle(.text)
                    }
                }
               
                Spacer()
                RedButton(action: {}, title: "Start")
                    .padding(.bottom, 100)
                
            }
        }.navigationBarHidden(true)
        
        
    }
}

#Preview {
    FinalIntroView()
}
