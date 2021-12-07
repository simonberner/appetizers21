//
//  OrderView.swift
//  Appetizers21
//
//  Created by Simon Berner on 24.11.21.
//

import SwiftUI

struct OrderView: View {

    // access the injected environment var
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // swipe to delete is only possible on ForEach
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        // SwiftUI passes the indexSet in based on the ForEach
                        .onDelete(perform: { indexSet in
                            order.remove(indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    OrderButton(title: " $\(order.totalPrice, specifier: "%.2f") - Place Order",
                                action: {
                        print("Order placed!")
                    })
                        .padding(.bottom, 25)
                }

                if order.items.isEmpty {
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
