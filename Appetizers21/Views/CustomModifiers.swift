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

struct ListCellImageStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}

//extension View {
//    func standardButtonStyle() -> some View {
//        self.modifier(StandardButtonStyle())
//    }
//}
