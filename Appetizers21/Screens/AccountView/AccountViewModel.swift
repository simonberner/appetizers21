//
//  AccountViewModel.swift
//  Appetizers21
//
//  Created by Simon Berner on 03.12.21.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem: AlertItem?
    @Published var showingAlert = false

    // Input/Text validation
    private var isValidForm: Bool {
        // 1st validation: does every text field has a value?
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            showingAlert = true
            return false
        }

        // 2nd validation: is the Email valid?
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEMail
            showingAlert = true
            return false
        }

        return true
    }

    func saveChanges() {
        guard isValidForm else { return }
    }

}
