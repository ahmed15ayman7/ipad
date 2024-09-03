//
//  SlideView.swift
//  graduation project
//
//  Created by mazen eldeeb on 03/09/2024.
//

import SwiftUI

struct SlideView: View {
    let slide: Slide
    var body: some View {
        ZStack {
            Image("Blob")
            
            
            if let image = slide.image {
                ZStack {
                    if image == "Cat" {
                        VStack {
                            HStack {
                                Spacer()
                                Image("CatFrame")
                            }.padding(.horizontal)
                            Spacer()
                        }
                    } else if image == "Bird" {
                        VStack {
                            HStack {
                                Image("UpperCloud")
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Image("LowerCloud")
                            }
                            Spacer()
                        }
                    }
                    VStack {
                        Spacer()
                        Image(image)
                            .resizable()
                            .scaledToFit()
                        Text(slide.description)
                            .font(.system(size: 35))
                            .foregroundStyle(.text)
                            .lineLimit(2)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        Spacer()

                    }
                    .padding(.top, 20)
                    .padding(.horizontal)
                    
                }
            }
            
            else {
                Text(slide.description)
                    .font(.system(size: 40))
                    .foregroundStyle(.text)
                    .lineLimit(4)
                    .padding()
                    .lineSpacing(15)
                    .multilineTextAlignment(.center)
            }
        }
        
    }
}

#Preview {
    SlideView(slide: Slide.sampleSlide)
}
