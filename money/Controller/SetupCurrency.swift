//
//  ChooseCurrency.swift
//  money
//
//  Created by User on 10.12.2022.
//

import Foundation

class SetupCurrency {
    
    func setupCurrency(index: Int) {
        switch index {
        case 0:
            currency = "$"
        case 1:
            currency = "€"
        case 2:
            currency = "₴"
        case 3:
            currency = "RUB"
        case 4:
            currency = "BYN"
        default:
            currency = "$"
        }
    }
    
}
