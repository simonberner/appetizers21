//
//  AccountViewModel.swift
//  Appetizers21
//
//  Created by Simon Berner on 03.12.21.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    //@AppStorage explained: https://www.avanderlee.com/swift/appstorage-explained/
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @Published var showingAlert = false

    func saveUser() {
        // check if isValidForm
        guard isValidForm else { return }

        // encode the user into Data
        do {
            userData = try JSONEncoder().encode(user)
            alertItem = AlertContext.userSaveSuccess
            showingAlert = true
        } catch {
            alertItem = AlertContext.invalidUserData
            showingAlert = true
        }
    }

    func retrieveUser() {
        // check if we have userData in UserDefaults
        // else return nil
        guard let userData = userData else { return }

        // if we have userData
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
            showingAlert = true
        }

    }

    // Input/Text validation
    private var isValidForm: Bool {
        // 1st validation: does every text field has a value?
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            showingAlert = true
            return false
        }

        // 2nd validation: is the Email valid?
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEMail
            showingAlert = true
            return false
        }

        return true
    }



}
