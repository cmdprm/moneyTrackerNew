//
//  NewCategory.swift
//  money
//
//  Created by User on 10.12.2022.
//

import Foundation

class NewCategory {
    
    func addCategory(isIncomeSelected: Bool, newCategory: Category) -> Bool {
        var status: Int?
        
        if isIncomeSelected == true {
            status = 1
        } else {
            status = 0
        }
        
        if status == 1 {
            catOfIncomes.append(newCategory)
            return true
        } else if status == 0 {
            catOfWastes.append(newCategory)
            return true
        } else {
            return false
        }
    }
    
}
