//
//  IntroView+Handler.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import Foundation


extension IntroView {
    class Handler: ObservableObject {
        @Published var slideIndex: Int = 0 {
                    didSet {
                        isLast = slideIndex == (slides.count - 1)
                    }
                }
        @Published var isLast: Bool = false
        @Published var navigateToNextView: Bool = false
        let slides: [Slide] = [
            Slide(description: "In the land of FitQuest, you can be.. ", tag: 0),
            Slide(image: "Cat", description: "flexible as a cat", tag: 1),
            Slide(image: "Bird", description: "light as a bird", tag: 2),
            Slide(image: "Elephant", description: "the strongest of them all", tag: 3),
            Slide(image: "ProgressFrame", description: "Parents will assign quests", tag: 4),
            Slide(image: "Champion", description: "and you will win badges", tag: 5)
        ]
        
        func goToNext() {
            if isLast {
                navigateToNextView.toggle()
            } else {
                slideIndex += 1
            }
               
        }
    }
}
