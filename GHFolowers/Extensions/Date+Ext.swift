//
//  Date+Ext.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d yyyy"
        return dateFormatter.string(from: self)
    }
}
