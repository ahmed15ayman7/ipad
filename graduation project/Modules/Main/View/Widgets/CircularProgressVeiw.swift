//
//  CircularProgressVeiw.swift
//  graduation project
//
//  Created by mazen eldeeb on 06/09/2024.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: CGFloat
    let lineWidth: CGFloat = 10
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.1)
                .foregroundColor(Color(red: 113/255, green: 119/255, blue: 113/255))
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(.mainRed)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
            Text("\(Int(progress * 100))%")
                .font(.system(size: 30))
                .bold()
                .foregroundStyle(.mainRed)
        }
    }
}


#Preview {
    CircularProgressView(progress: 0.5)
}
