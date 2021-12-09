//
//  ContentView.swift
//  Appetizers21
//
//  Created by Simon Berner on 24.11.21.
//

import SwiftUI

struct AppetizerTabView: View {

    // access the injected environment var
    @EnvironmentObject var order: Order

    var body: some View {
        TabView {
            // ViewBuilder of this TabView
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
