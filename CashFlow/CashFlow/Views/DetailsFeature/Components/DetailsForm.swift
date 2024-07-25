//
//  DetailsForm.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct DetailsForm: View {
    let transaction : TransactionEntity
    var body: some View {
      
        HStack{
            Image(systemName:TransactionSymbols(rawValue:transaction.symbol ?? "")?.symbol ?? "xmark")
                .font(.title)
                .frame(width: 60,height: 60)
                .background(TransactionSymbols(rawValue:transaction.symbol ?? "")?.color ?? .blue)
                .clipShape(Circle())
            
            Text(TransactionSymbols(rawValue:transaction.symbol ?? "")?.rawValue ?? "")
                .font(.system(size: 18))
                .bold()
        }
        
        Form {
            Section("Description") {
                Text((transaction.title ?? ""))
                    .font(.title)

            }
            
            Section("Amount") {
                
                Text(String(format : "%.2f" ,transaction.amount) + "€")
                    .font(.title)
                    .bold()
            }
            
            Section("Type") {
                Text(transaction.transactionType == "Incomes" ? "Income" : "Expense")
                    .font(.title)
                    .bold()
                    .foregroundStyle(transaction.transactionType == "Incomes" ? .green : .red)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

