//
//  Slide.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import Foundation

struct Slide: Identifiable, Equatable {
    let id: UUID = UUID()
    var image: String?
    let description: String
    let tag: Int
    
    
    
    static let sampleSlide: Slide = Slide(image: "Bird", description: "flexible as a cat", tag: 0)
}
