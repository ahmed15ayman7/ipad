//
//  Badge.swift
//  graduation project
//
//  Created by mazen eldeeb on 07/09/2024.
//

import Foundation

struct Badge: Identifiable {
    let id = UUID()
    let image: String
    let isGotten: Bool
    
    static let sampleBadges: [Badge] = [Badge(image: "Champion", isGotten: true), Badge(image: "Champion", isGotten: false), Badge(image: "Champion", isGotten: true), Badge(image: "Champion", isGotten: false)]
    static let sampleBadge: Badge = Badge(image: "Champion", isGotten: false)
}

