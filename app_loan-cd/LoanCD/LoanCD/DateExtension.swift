//
//  DateExtension.swift
//  LoanCD
//
//  Created by Carlos Amaral on 23/11/21.
//

import Foundation

extension Date {
    var dayNumberOfYear : Int? {
        return Calendar.current.dateComponents([.year], from: self).year
    }
    
    var longDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
