//
//  User.swift
//  Appetizers21
//
//  Created by Simon Berner on 05.12.21.
//

import Foundation

// Codable is used to decode and encode data
struct User: Codable {

    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false

}
