//
//  SummaryHeader.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct SummaryHeader: View {
    
    @ObservedObject var viewModel:TransactionsViewModel
    
    var body: some View {
        
        HStack {
            Text("Remaining Salary:")
            Spacer()
            Text("\(String(format : "%.2f" , viewModel.remainingSalary))€")
                .foregroundStyle(.green)
            
        }
        .padding()
        HStack {
            Text("Costs:")
            Spacer()
            Text("\(String(format : "%.2f" , viewModel.expenses))€")
                .foregroundStyle(.red)
        }
        .padding()
    }
}

