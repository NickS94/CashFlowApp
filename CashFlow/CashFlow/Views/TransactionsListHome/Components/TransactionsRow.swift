//
//  BudgetRow.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct TransactionsRow: View {
    let expense:Expense
    
    var body: some View {
        HStack {
            
            Image(systemName: ExpenseSymbols(rawValue:expense.symbol ?? "")?.symbol ?? "xmark")
                .font(.title2)
                .frame(width: 40,height: 40)
                .background(ExpenseSymbols(rawValue: expense.symbol ?? "")?.color ?? .accentColor)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 5) {
                Text(expense.title ?? "")
                    .font(.system(size: 14))
                
                Text((expense.date?.dateString ?? ""))
                    .font(.system(size: 14))
            }
            
            Spacer()
            
            Text("-"+(String(format:"%.2f",expense.amount))+"€")
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}


