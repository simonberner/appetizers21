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

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $accountViewModel.user.firstName)
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                    TextField("Email", text: $accountViewModel.user.email)
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
