//
//  AnalyticsTable.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 26.07.24.
//

import SwiftUI

struct AnalyticsTable: View {
    
    @ObservedObject var viewModel:TransactionsViewModel
    
    var body: some View {
        VStack{
            
            HStack{
                Text("Summary of Incomes: " )
                Text(String(format:"%.2f", viewModel.incomes) + "€")
                    .font(.system(size: 18).bold())
                    .foregroundStyle(.green)
            }
            
            HStack{
                Text("Summary of Expenses: ")
                Text(String(format:"%.2f", viewModel.expenses) + "€")
                    .font(.system(size: 18).bold())
                    .foregroundStyle(.red)
            }
            
            Divider()
            Text("The total percentage of your expenses is: ")
            
            Text(String(format:"%.2f",viewModel.expensesPercentage) + "%")
                .font(.system(size: 22))
                .foregroundStyle(viewModel.expensesPercentage >= 50 ? .orange : .blue)
        }
        .padding()
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))

    }

}


