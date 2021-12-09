//
//  ContentView.swift
//  Appetizers21
//
//  Created by Simon Berner on 24.11.21.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            // ViewBuilder of this TabView
            AppetizerListView()
                .tabItem { // tabItem ViewModifier
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
