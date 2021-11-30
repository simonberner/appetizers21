//
//  Alert.swift
//  Appetizers21
//
//  Created by Simon Berner on 27.11.21.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {

    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server is invalid. Please contact the support."),
                                       dismissButton: .default(Text("OK")))

    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("The data received from the server is invalid. Please contact the support."),
                                           dismissButton: .default(Text("OK")))

    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("The was an issue connecting to the server. If this problem persists, please contact the support."),
                                      dismissButton: .default(Text("OK")))

    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete you request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
}
