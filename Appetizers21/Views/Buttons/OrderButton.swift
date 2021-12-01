//
//  APButton.swift
//  Appetizers21
//
//  Created by Simon Berner on 30.11.21.
//

import SwiftUI

struct OrderButton: View {

    let price: Double

    var body: some View {
        Button {

        } label: {
            Text("$\(price, specifier: "%.2f") - Add to Order")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 220, height: 40)
                .background(Color.brandPrimary)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(price: 9.99)
    }
}
