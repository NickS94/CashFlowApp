//
//  BudgetRow.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct TransactionsRow: View {
    let transaction:TransactionEntity
    
    var body: some View {
        HStack {
            
            Image(systemName: TransactionSymbols(rawValue:transaction.symbol ?? "")?.symbol ?? "xmark")
                .font(.title2)
                .frame(width: 40,height: 40)
                .background(TransactionSymbols(rawValue: transaction.symbol ?? "")?.color ?? .accentColor)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 5) {
                Text(transaction.title ?? "")
                    .font(.system(size: 14))
                
                Text((transaction.date?.dateString ?? ""))
                    .font(.system(size: 14))
            }
            
            Spacer()
            
            Text(transaction.isIncome ? "+" + (String(format:"%.2f",transaction.amount)) + "€" : "-" + (String(format:"%.2f",transaction.amount)) + "€")
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(transaction.isIncome ? .green : .red)
            
            
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}


