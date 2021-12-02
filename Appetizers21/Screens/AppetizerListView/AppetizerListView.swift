//
//  AppetizerListView.swift
//  Appetizers21
//
//  Created by Simon Berner on 24.11.21.
//

import SwiftUI

// The view shall not contain any business logic and data.
// It redraws upon changes of the viewModel
struct AppetizerListView: View {

    // Listening to changes in the viewModel
    // (Redraws the view when something (appetizers, alertItem) changes)
    @StateObject var viewModel = AppetizerListViewModel()
    // state property: https://developer.apple.com/documentation/swiftui/state
    @State private var isShowingDetailView = false
    @State private var selectedAppetizer: Appetizer?

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                   AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetailView = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(isShowingDetailView)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetailView ? 20 : 0)

            // redraws this view and puts the detail view of an appetizer on top
            if isShowingDetailView {
                AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetail: $isShowingDetailView)
            }

            // the loading view is put on top
            if viewModel.isLoading {
                ProgressView("Loading...")
            }


        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
