//
//  BudgetRow.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct BudgetRow: View {
    @Binding var expense: Expense
    
    var body: some View {
        HStack {
            Image(systemName: expense.symbol)
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(Circle())
               
            VStack(alignment: .leading, spacing: 5) {
                Text(expense.description)
                Text("Amount: \(expense.amount, specifier: "%.2f") €")
            }
            Spacer()
        }
        .padding(5)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

#Preview {
    BudgetRow(expense: .constant(Expense(amount: 22.2, description: "Sample", symbol: "cart")))
}
