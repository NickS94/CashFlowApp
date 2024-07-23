//
//  BudgetDetailView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct BudgetDetailView: View {
    @Binding var expense: Expense
    
    var body: some View {
        VStack(alignment: .leading) {
            
                VStack{ Image(systemName: expense.symbol)
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .clipShape(Circle())
                }
            
            
            Text("Description: \(expense.description)")
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

#Preview {
    BudgetDetailView(expense: .constant(Expense(amount: 20, description: "Groceries", symbol: "cart")))
}
