//
//  View+Extension.swift
//  graduation project
//
//  Created by mazen eldeeb on 17/09/2024.
//

import SwiftUI

extension View {
    
    public func removeFocusOnTap() -> some View {
        modifier(RemoveFocusOnTapModifier())
    }
    
    func placeholder<T:View>(_ holder: T, show: Bool) -> some View {
        self.modifier(PlaceholderModifer(placeHolder: holder, show: show))
    }
    
}

