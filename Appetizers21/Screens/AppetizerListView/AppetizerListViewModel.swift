//
//  AppetizerViewModel.swift
//  Appetizers21
//
//  Created by Simon Berner on 26.11.21.
//

import SwiftUI

// final because it shall not be subclassed
// Anything in this class will be rerouted to the main (UI) queue/thread
@MainActor final class AppetizerListViewModel: ObservableObject {

    // Published: broadcasts its changes to the AppetizerListView
    @Published var appetizers: [Appetizer] = []
    // Broadcast the alert
    @Published var alertItem: AlertItem?
    // Broadcast when retrieving the JSON data
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?

    // with async/await we don't have to explicitly put things onto the main queue anymore
    func getAppetizers() {
        isLoading = true // now loading...

        // Put code into a async context
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                // check for the type of error
                // (the custom APError or the Swift error from the URLSession)
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                isLoading = false
            }
        }
    }

    // Setting the data is triggering the UI update (reactive)
    // That is why getting the data needs to happen on the main thread with SwiftUI
    //    func getAppetizers() {
    //        isLoading = true // now loading...
    //        NetworkManager.shared.getAppetizers { [self] result in // capture self (introduced in Swift 5.3)
    //            DispatchQueue.main.sync {
    //                isLoading = false // ...finished loading (we have result)
    //                switch result {
    //                    // Success case
    //                case .success(let appetizers):
    //                    self.appetizers = appetizers
    //
    //                    // Failure case
    //                case .failure(let error):
    //                    switch error {
    //                    case .invalidData:
    //                        alertItem = AlertContext.invalidData
    //
    //                    case .invalidURL:
    //                        alertItem = AlertContext.invalidURL
    //
    //                    case .invalidResponse:
    //                        alertItem = AlertContext.invalidResponse
    //
    //                    case .unableToComplete:
    //                        alertItem = AlertContext.unableToComplete
    //                    }
    //                }
    //            }
    //        }
    //    }
}
