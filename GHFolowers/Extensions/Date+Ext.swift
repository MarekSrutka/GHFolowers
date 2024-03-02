//
//  Date+Ext.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.day().month(.wide).year())
    }
}
