//
//  AccountView.swift
//  Appetizers21
//
//  Created by Simon Berner on 24.11.21.
//

import SwiftUI

struct AccountView: View {

    // @StateObject property wrapper will persist the value during the rendering!
    @StateObject var accountViewModel = AccountViewModel()
    // iOS15: new property wrapper
    @FocusState private var focusedTextField: FormTextField?

    enum FormTextField {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $accountViewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next) // change keyboard 'return' key to 'next'

                    TextField("Last Name", text: $accountViewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)

                    TextField("Email", text: $accountViewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil } // will dismiss the keyboard
                        .submitLabel(.continue) // continue with the form
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $accountViewModel.user.birthdate, displayedComponents: .date)

                    Button {
                        accountViewModel.saveUser()
                    } label: {
                        Text("Save Changes")
                    }
                }

                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $accountViewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
            .navigationTitle("🙂 Account")
            .toolbar { // trailing closure syntax
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            accountViewModel.retrieveUser()
        }
        .alert(isPresented: $accountViewModel.showingAlert) {
            Alert(title: accountViewModel.alertItem!.title,
                  message: accountViewModel.alertItem?.message,
                  dismissButton: accountViewModel.alertItem?.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
