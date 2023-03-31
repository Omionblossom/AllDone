//
//  DateExt.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/22.
//

import Foundation

// MARK: - Useful extensions
extension Date {
    var longFormat: String {
        string(format: "MM/dd/yyyy")
    }
    
    var headerTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMMM d"
        return formatter.string(from: self)
    }
    
    var year: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "y"
        return formatter.string(from: self)
    }
    
    var month: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self)
    }
    
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
