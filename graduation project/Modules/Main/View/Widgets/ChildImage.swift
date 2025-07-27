//
//  ChildImage.swift
//  graduation project
//
//  Created by mazen eldeeb on 01/10/2024.
//

import SwiftUI

struct ChildImage: View {
    let male: Bool
    let image: String
    @Binding var isMale: Bool
    
    var body: some View {
        Button {
            isMale = male
        } label: {
            Image(image)
                .frame(width: 80, height: 80)
                .padding(30)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .padding(isMale == male ? 2 : 0)
                .background(isMale == male ? .mainRed : .clear)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ChildImage(male: true,image: "", isMale: .constant(true))
}
