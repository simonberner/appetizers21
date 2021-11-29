//
//  LoadingView.swift
//  Appetizers21
//
//  Created by Simon Berner on 28.11.21.
//

import Foundation
import SwiftUI

// UIKit view loading spinner wrapped into a SwiftUI view with UIViewRepresentable
struct ActivityIndicator: UIViewRepresentable {

    // replaces the body var on the UIViewRepresentable view
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

}

// SwiftUI view
struct LoadingView: View {

    var body: some View {
        ZStack {
            Color(.systemBackground) // white primary background (from UIKit)
                .edgesIgnoringSafeArea(.all)

            ActivityIndicator()
        }
    }
}
