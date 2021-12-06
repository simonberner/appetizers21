//
//  Appetizer.swift
//  Appetizers21
//
//  Created by Simon Berner on 25.11.21.
//

import Foundation

// Model
// Decode JSON data into a Appetizer object
struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String // name of the property has to be same as in the JSON response, as we are using Codable!
    let calories: Int
    let protein: Int
    let carbs: Int
}

// Helper response object
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// Mock Appetizer data
struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer, it's yummy.",
                                           price: 9.00,
                                           imageURL: "",
                                           calories: 00,
                                           protein: 99,
                                           carbs: 99)

    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]

    static let orderItemOne = Appetizer(id: 0001,
                                           name: "Test Appetizer One",
                                           description: "This is the description for my appetizer, it's yummy.",
                                           price: 9.00,
                                           imageURL: "",
                                           calories: 00,
                                           protein: 99,
                                           carbs: 99)

    static let orderItemTwo = Appetizer(id: 0002,
                                           name: "Test Appetizer Two",
                                           description: "This is the description for my appetizer, it's yummy.",
                                           price: 9.00,
                                           imageURL: "",
                                           calories: 00,
                                           protein: 99,
                                           carbs: 99)

    static let orderItemThree = Appetizer(id: 0003,
                                           name: "Test Appetizer Three",
                                           description: "This is the description for my appetizer, it's yummy.",
                                           price: 9.00,
                                           imageURL: "",
                                           calories: 00,
                                           protein: 99,
                                           carbs: 99)

    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]

}
