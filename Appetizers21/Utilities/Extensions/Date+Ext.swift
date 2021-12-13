//
//  Date+Ext.swift
//  Appetizers21
//
//  Created by Simon Berner on 13.12.21.
//

import Foundation

extension Date {

    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }

    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
