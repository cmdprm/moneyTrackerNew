//
//  AccountCounter.swift
//  money
//
//  Created by User on 01.12.2022.
//

import Foundation

struct AccountCounter {
    
    func calculate(operation: Operation, index: Int) {
        if operation.status == 0 {
            accounts[index].balance -= operation.amount
        } else {
            accounts[index].balance += operation.amount
        }
    }
    
}

let counter = AccountCounter()
