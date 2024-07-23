//
//  DetailsForm.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct DetailsForm: View {
    let expense : Expense
    var body: some View {
      
        HStack{
            Image(systemName:ExpenseSymbols(rawValue:expense.symbol ?? "")?.symbol ?? "xmark")
                .font(.title)
                .frame(width: 60,height: 60)
                .background(ExpenseSymbols(rawValue:expense.symbol ?? "")?.color ?? .blue)
                .clipShape(Circle())
            
            Text(ExpenseSymbols(rawValue:expense.symbol ?? "")?.rawValue ?? "")
                .font(.system(size: 18))
                .bold()
        }
        
        Form {
            Section("Description") {
                Text((expense.title ?? ""))
                    .font(.title)
                
            }
            
            Section("Amount") {
                
                Text(String(format : "%.2f" ,expense.amount) + "€")
                    .font(.title)
                 
            }
        }
        
    }
}

