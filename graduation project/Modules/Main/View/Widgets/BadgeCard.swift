//
//  BadgeCard.swift
//  graduation project
//
//  Created by mazen eldeeb on 08/09/2024.
//

import SwiftUI

struct BadgeCard: View {
    let badge: Badge
    var body: some View {
        Image(badge.isGotten ? badge.image : "Lock")
            .foregroundStyle(.mainRed)
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.gray.opacity(0.07))
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .padding(.bottom)
    }
}

#Preview {
    BadgeCard(badge: Badge.sampleBadge)
}
