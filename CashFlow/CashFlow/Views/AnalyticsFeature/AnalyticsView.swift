//
//  SetSalarySheetView.swift
//  CashFlow
//
//  Created by feras  hababa  on 22.07.24.
//

import SwiftUI
import Charts


struct AnalyticsView: View {
    
    @ObservedObject var viewModel : TransactionsViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                AnalyticsTable(viewModel: viewModel)
                
                
                Chart(viewModel.transactionsList){ item in
                    BarMark(x:.value("Amounts",item.amount) ,y: .value("Categories", item.symbol ?? ""), width: 10, height: 100)
                        .foregroundStyle(TransactionSymbols(rawValue: item.symbol ?? "")?.color ?? .blue)
                        .cornerRadius(12)
                }
                
                
            }
            .padding()
            .navigationTitle("Analytics")
        }
        .onAppear{
            viewModel.transactionTypeFilter()
        }
    }
}


#Preview {
    AnalyticsView(viewModel: TransactionsViewModel())
}
