//
//  BudgetDetailView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct BudgetDetailView: View {
    let expense: Expense
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack{ Image(systemName:ExpenseSymbols(rawValue:expense.symbol ?? "")?.symbol ?? "xmark")
                    .font(.title)
                    .frame(width: 60,height: 60)
                    .background(ExpenseSymbols(rawValue:expense.symbol ?? "")?.color ?? .blue)
                    .clipShape(Circle())
            }
            
            
            Text("Description: \(expense.title ?? "")")
                .font(.title)
                .padding(.bottom, 10)
            
            Text("Amount: \(expense.amount, specifier: "%.2f") €")
                .font(.title)
                .padding(.bottom, 10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Expense Detail")
    }
}

