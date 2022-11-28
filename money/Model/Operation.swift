//
//  Operation.swift
//  money
//
//  Created by User on 25.11.2022.
//

import Foundation

struct Operation {
    let id = UUID()
    let title: String
    let category: String
    let date: Date
    let amount: Float
    let status: Int
}
