//
//  PlaceholderModifer.swift
//  graduation project
//
//  Created by mazen eldeeb on 18/09/2024.
//

import SwiftUI

struct PlaceholderModifer<T: View>: ViewModifier {
    var placeHolder: T
    var show: Bool
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show { placeHolder }
            content
        }
    }
}
