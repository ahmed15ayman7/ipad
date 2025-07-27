//
//  ProgressView.swift
//  graduation project
//
//  Created by mazen eldeeb on 06/09/2024.
//

import SwiftUI

struct ProgressMainView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var progress: CGFloat = 0.5
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Progress")
                    .font(.system(size: 36))
                    .foregroundStyle(.text)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.notSelected)
                ScrollView {
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 195)
                                .foregroundColor(.backgroundWhite)
                            Circle()
                                .frame(width: 180, height: 180)
                                .foregroundColor(.white)
                            Image("Child")
                        }
                        Text("\(authViewModel.name)")
                            .bold()
                            .font(.system(size: 32))
                            .padding(.top, 8)
                            .foregroundStyle(.text)
                        Text("Level 1")
                            .font(.system(size: 16))
                            .foregroundStyle(.text)
                        HStack {
                            ProgressCard(
                                title: "Quest Completion", child: CircularProgressView(progress: 0)
                                    .frame(width: 100).padding(.top),
                                color: .mainRed
                            )
                            
                            ProgressCard(
                                title: "Avg Day Completion", child: HStack(alignment: .lastTextBaseline) {
                                    Text("0.0")
                                        .bold()
                                        .font(.system(size: 32))
                                        .foregroundStyle(Color(red: 52/255, green: 135/255, blue: 111/255))
                                    Text("min/s")
                                        .foregroundStyle(Color(red: 52/255, green: 135/255, blue: 111/255))
                                },
                                color: Color(red: 52/255, green: 135/255, blue: 111/255)
                                
                            )
                        }
                        
                        Text("Day 7 Of")
                            .foregroundStyle(.mainRed)
                            .font(.system(size: 16))
                            .padding(.top)
                        Text("iPad challenge 🎉 ")
                            .foregroundStyle(.text)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.notSelected, lineWidth: 2)
                            )
                        HStack(spacing: 0) {
                            StepIndicator(title: "week 1", isActive: true, isLast: false)
                            StepIndicator(title: "week 2", isActive: false, isLast: false)
                            StepIndicator(title: "week 3", isActive: false, isLast: true)
                        }.padding()

                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.top)
                }

                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundWhite)
        }
        
        
    }
}

#Preview {
    ProgressMainView()
}




