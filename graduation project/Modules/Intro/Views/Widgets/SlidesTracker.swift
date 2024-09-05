//
//  SlidesTracker.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import SwiftUI

struct SlidesTracker: View {
    @Binding var slideIndex: Int
    let slidesCount: Int
    var body: some View {
          HStack {
              Spacer()
              HStack(spacing: 8) {
                  ForEach(0..<slidesCount, id: \.self) { index in
                      Circle()
                          .fill(index == slideIndex ? Color.mainRed : Color.notSelected)
                          .frame(width: 10, height: 10)
                  }
              }
              Spacer()
          }
          .padding(.bottom, 50)
      }
}

#Preview {
    SlidesTracker(slideIndex: .constant(0), slidesCount: 3)
}
