//
//  AnalyticsTable.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 26.07.24.
//

import SwiftUI

struct AnalyticsTable: View {
    
    @ObservedObject var viewModel:AnalyticsViewModel
    
    var body: some View {
        VStack{
           
            Text("Summary of Incomes :" + String(format:"%.2f", viewModel.incomes) + "€")
                    .font(.system(size: 18).bold())
               
            Text("Summary of Expenses: " + String(format:"%.2f", viewModel.expenses) + "€")
                    .font(.system(size: 18).bold())
            Divider()
            Text("The total percentage of your expenses is: ")
            
            Text(String(format:"%.2f",viewModel.expensesPercentage()) + "%")
                .font(.system(size: 22))
                .foregroundStyle(viewModel.expensesPercentage() >= 50 ? .orange : .black)
        }
        .padding()
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
        
    }
    
    
}


