//
//  AppetizerViewModel.swift
//  Appetizers21
//
//  Created by Simon Berner on 26.11.21.
//

import SwiftUI

// final because it shall not be subclassed
final class AppetizerListViewModel: ObservableObject {

    // Published: broadcasts its changes to the AppetizerListView
    @Published var appetizers: [Appetizer] = []
    // Broadcast the alert
    @Published var alertItem: AlertItem?

    // Setting the data is triggering the UI update (reactive)
    // That is why getting the data needs to happen on the main thread with SwiftUI
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { [self] result in // capture self (introduced in Swift 5.3)
            DispatchQueue.main.sync {
                switch result {
                    // Success case
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                    // Failure case
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData

                    case .invalidURL:
                        alertItem = AlertContext.invalidURL

                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse

                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
