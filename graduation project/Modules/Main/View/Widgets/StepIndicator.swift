//
//  StepIndicator.swift
//  graduation project
//
//  Created by mazen eldeeb on 06/09/2024.
//

import SwiftUI

struct StepIndicator: View {
    var title: String?
    var strokeColor: Color?
    let isActive: Bool
    let isLast: Bool
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 0) {
                Circle()
                    .stroke(strokeColor ?? Color.notSelected, lineWidth: 1)
                    .frame(width: 37)
                    .foregroundStyle(isActive ? .mainRed : .notSelected)
                if !isLast {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(isActive ? .mainRed : .notSelected)
                }
            }
            if let title = title {
                Text(title)
                    .foregroundStyle(isActive ? .mainRed : .gray)
                    .font(.system(size: 15))
            }
        }
       
    }
}

#Preview {
    StepIndicator(title: "week 1", isActive: true, isLast: false)
}
