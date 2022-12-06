//
//  OperationData.swift
//  money
//
//  Created by User on 25.11.2022.
//

import Foundation

/// Currency
/// $ - Dollars
/// € - Euros
/// RUB - Russian Rubles
/// BYN - Belarussian Rubles

var currency = "$"

var operations = [
    [
        Operation(title: "Sosedi", category: catOfWastes[0], date: Date(timeIntervalSinceNow: -50000), amount: 10.2, status: 0, account: "Main"),
        Operation(title: "Taxi", category: catOfIncomes[0], date: Date(timeIntervalSinceNow: -50000), amount: 2.53, status: 1, account: "Main")
    ],
    [
        Operation(title: "Test", category: catOfWastes[3], date: Date(timeIntervalSinceNow: -100000), amount: 7.53, status: 0, account: "Main")
    ]
]
