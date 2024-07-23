//
//  Expense.swift
//  CashFlow
//
//  Created by feras  hababa  on 22.07.24.
//

import Foundation

struct Expense: Identifiable {
    var id = UUID()
    var amount: Double
    var description: String
    var symbol: String
}
