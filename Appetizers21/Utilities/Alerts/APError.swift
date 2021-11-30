//
//  APError.swift
//  Appetizers21
//
//  Created by Simon Berner on 25.11.21.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
