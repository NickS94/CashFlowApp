//
//  SummaryHeader.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct SummaryHeader: View {
    
    var actionExpenseSummary:()->Double
    var actionIncomeSummary:()->Double
    
    var body: some View {
        
        HStack {
            Text("Remaining Salary:")
            Spacer()
            Text("\(String(format : "%.2f" , actionIncomeSummary()))€")
                .foregroundStyle(.green)
            
        }
        .padding()
        HStack {
            Text("Costs Summary:")
            Spacer()
            Text("\(String(format : "%.2f" , actionExpenseSummary()))€")
                .foregroundStyle(.red)
        }
        .padding()
    }
}

#Preview {
    SummaryHeader(actionExpenseSummary: {0.0}, actionIncomeSummary: {0.0})
}
