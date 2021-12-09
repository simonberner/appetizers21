//
//  APButton.swift
//  Appetizers21
//
//  Created by Simon Berner on 30.11.21.
//

import SwiftUI

struct OrderButton: View {

    let title: LocalizedStringKey
    // closure property (closure which initialises the property)
    var action = { }

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
        }
        .modifier(StandardButtonStyle())
//        .standardButtonStyle()
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(title: "Test Order")
    }
}
