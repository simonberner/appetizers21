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

    // Setting the data is triggering the UI update (reactive)
    // That is why getting the data needs to happen on the main thread with SwiftUI
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
