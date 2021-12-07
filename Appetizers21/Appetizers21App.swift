//
//  Appetizers21App.swift
//  Appetizers21
//
//  Created by Simon Berner on 24.11.21.
//

import SwiftUI

@main // entry point for the app
struct Appetizers21App: App {

    var order = Order()

    var body: some Scene { // Scene is the window of the app
        WindowGroup {
            // The window of every app instance is initialised with a AppetizerTabView
            // Injecting the order into the TabViews environment and make it available
            // to all the child views
            AppetizerTabView().environmentObject(order)
        }
    }
}
