//
//  CustomModifiers.swift
//  Appetizers21
//
//  Created by Simon Berner on 09.12.21.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

//extension View {
//    func standardButtonStyle() -> some View {
//        self.modifier(StandardButtonStyle())
//    }
//}
