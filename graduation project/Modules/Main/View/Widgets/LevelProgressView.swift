//
//  LevelProgressView.swift
//  graduation project
//
//  Created by mazen eldeeb on 06/09/2024.
//

import SwiftUI

struct LevelProgressView: View {
    let startValue: Int
    let endValue: Int
    @Binding var progress: CGFloat

    var body: some View {
        HStack(alignment: .bottom) {
            VStack {
                ProgressView(value: progress, total: CGFloat(endValue - startValue))
                    .background(.remainingProgress)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .tint(.mainRed)

                HStack {
                    Text("\(Int(progress))")
                        .foregroundStyle(Color(red: 135/255, green: 119/255, blue: 119/255))
                    Spacer()
                    Text("\(endValue)") // Changed to endValue
                        .foregroundStyle(Color(red: 135/255, green: 119/255, blue: 119/255))
                }
            }
            
            ZStack {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color(red: 254/255, green: 252/255, blue: 248/255))
                Circle()
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
                Circle()
                    .foregroundStyle(.mainRed)
                    .frame(width: 40, height: 40)
                Image(systemName: "shield.fill")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    LevelProgressView(startValue: 500, endValue: 1000, progress: .constant(0.5))
}
