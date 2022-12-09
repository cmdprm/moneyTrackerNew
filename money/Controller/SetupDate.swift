//
//  SetupDate.swift
//  money
//
//  Created by User on 09.12.2022.
//

import Foundation

class SetupDate {
    
    func setupDate(newOper: Operation) {
        if let firstOperOfFirstSection = operations[0].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            let lastDate = dateFormatter.string(from: firstOperOfFirstSection.date)
            let newDate = dateFormatter.string(from: newOper.date)
            
            checkDate(newOper: newOper, lastDate: lastDate, newDate: newDate)
        }
    }

    func checkDate(newOper: Operation, lastDate: String, newDate: String) {
        if lastDate == newDate {
            operations[0].insert(newOper, at: 0)
        } else {
            operations.insert([newOper], at: 0)
        }
    }
    
}
