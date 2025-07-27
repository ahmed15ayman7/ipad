//
//  Exercise.swift
//  graduation project
//
//  Created by mazen eldeeb on 20/09/2024.
//

import Foundation
import QuickPoseCore

struct Exercise: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let image: String
    let numberOfSets: Int
    let features: [QuickPoseCore.QuickPose.Feature]
    var isDone: Bool = false
    

    mutating func finished() {
        isDone = true
    }
}
