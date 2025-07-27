//
//  QuestViewModel.swift
//  graduation project
//
//  Created by mazen eldeeb on 20/09/2024.
//

import Foundation
import AVFoundation

@MainActor
class QuestViewModel: ObservableObject {
    var exersices: [Exercise] = [
        Exercise(name: "Squats", image: "Squats", numberOfSets: 3, features: [.fitness(.squats)]),
        Exercise(name: "Jumping Jacks", image: "JumpingJacks", numberOfSets: 3, features: [.fitness(.jumpingJacks)]),
        Exercise(name: "Glutes Bridge", image: "Glute", numberOfSets: 3, features: [.fitness(.gluteBridge)]),
        Exercise(name: "Plank", image: "Plank", numberOfSets: 10, features: [.fitness(.plank), .overlay(.wholeBody)]),
    ]
    
    @Published var currentIndex = 0
    
    func canMoveToNext() -> Bool {
        return currentIndex < 4
    }

    func getCurrentExercise() -> Exercise {
        if currentIndex >= 0 && currentIndex < exersices.count {
            return exersices[currentIndex]
        }
        return Exercise(name: "Plank", image: "Plank", numberOfSets: 10, features: [.fitness(.plank)])
    }
    
//    func playMusic() {
//        while true {
//            playSound()
//        }
//    }

    func playSound() {
        let systemSoundID: SystemSoundID = 1016
        AudioServicesPlaySystemSound(systemSoundID)
    }
}
