//
//  Order.swift
//  Appetizers21
//
//  Created by Simon Berner on 07.12.21.
//

import Foundation

// Environment object
// (is very similar to a view model, but it is not tightly coupled to a specific view)
final class Order: ObservableObject {

    @Published var items: [Appetizer] = []

    // computed property
    var totalPrice: Double {
        // 0 - is the parameter which is passed into the closure: here starting with a total of 0
        // $0 - is the first argument of the closure: here the passed in parameter
        // $1 - is the second argument of the closure: here an appetizer
        // (see https://developer.apple.com/documentation/swift/array/2298686-reduce)
        // Complexity: O(n), where n is the length of the sequence.
        items.reduce(0, { $0 + $1.price})
    }

    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }

    func remove(_ atOffsets: IndexSet) {
        items.remove(atOffsets: atOffsets)
    }

}
