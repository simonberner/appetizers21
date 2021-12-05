//
//  String+Ext.swift
//  Appetizers21
//
//  Created by Simon Berner on 03.12.21.
//

import Foundation

extension String {
    // We use a computed var to check wether an Email is valid
    // (https://www.tutorialspoint.com/email-and-phone-validation-in-swift)
    var isValidEmail: Bool {
        // regex for Email
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        // create a Predicate (filter) based on the regex
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        // check if self (the specified object), matches the Predicate (the filter/conditions that the predicate specifies)
        return testEmail.evaluate(with: self)
    }
}
