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
struct AppetizerResponse {
    let request: [Appetizer]
}

// Mock Appetizer data
struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is a description mock",
                                           price: 9.00,
                                           imageURL: "",
                                           calories: 00,
                                           protein: 99,
                                           carbs: 99)

    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
