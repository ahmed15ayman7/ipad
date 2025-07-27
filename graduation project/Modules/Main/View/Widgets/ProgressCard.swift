//
//  ProgressCard.swift
//  graduation project
//
//  Created by mazen eldeeb on 06/09/2024.
//

import Foundation
import SwiftUI

struct ProgressCard<T: View>: View {
    let title: String
    let child: T
    let color: Color
    
    var body: some View {
        VStack {
            Spacer()
            child
            Spacer()
            Text(title)
                .foregroundStyle(color)
                .padding()
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: 230)
        .background(color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}
