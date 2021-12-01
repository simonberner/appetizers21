//
//  OverlayButton.swift
//  Appetizers21
//
//  Created by Simon Berner on 30.11.21.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        Button {

        } label: {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.white)
                .imageScale(.large)
        }
    }
}

struct OverlayButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
