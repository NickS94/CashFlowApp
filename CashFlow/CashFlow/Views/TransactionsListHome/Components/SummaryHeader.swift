//
//  SummaryHeader.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct SummaryHeader: View {
    
    var actionSummary:()->Double
    
    var body: some View {
        
        HStack {
            Text("Remaining Salary:")
            Spacer()
        }
        .padding()
        HStack {
            Text("Costs Summary:")
            Spacer()
            Text("\(String(format : "%.2f" , actionSummary()))€")
        }
        .padding()
    }
}

#Preview {
    SummaryHeader(actionSummary: {0.0})
}
