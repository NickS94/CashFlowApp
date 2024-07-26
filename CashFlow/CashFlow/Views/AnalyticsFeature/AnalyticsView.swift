//
//  SetSalarySheetView.swift
//  CashFlow
//
//  Created by feras  hababa  on 22.07.24.
//

import SwiftUI
import Charts


struct AnalyticsView: View {
    
    @ObservedObject var viewModel : AnalyticsViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                AnalyticsTable(viewModel: viewModel)
                Chart {
                    ForEach(viewModel.transactionsList){ item in
                        SectorMark(angle: .value("Amounts", item.amount),innerRadius: 60, angularInset: 1)
                            .foregroundStyle(by: .value(item.title ?? "", item.symbol ?? ""))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Analytics")
        }
        .onAppear{
            viewModel.updateAction()
            
        }
    }
}


