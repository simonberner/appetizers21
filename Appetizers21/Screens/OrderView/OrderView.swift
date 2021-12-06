//
//  OrderView.swift
//  Appetizers21
//
//  Created by Simon Berner on 24.11.21.
//

import SwiftUI

struct OrderView: View {

    @State private var orderItems = MockData.orderItems

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // swipe to delete is only possible on ForEach
                    List {
                        ForEach(orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        // SwiftUI passes the indexSet in based on the ForEach
                        .onDelete(perform: { indexSet in
                            orderItems.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    OrderButton(title: "Place Order", action: {
                        print("TODO")
                    })
                        .padding(.bottom, 25)
                }

                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your oder.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
