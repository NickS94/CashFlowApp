//
//  ContentView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var transactionsViewModel = TransactionsViewModel()
    var body: some View {
        TabView {
            TransactionsView(viewModel: transactionsViewModel)
                .tabItem {
                    VStack{
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Transactions")
                    }
                }
            
            AnalyticsView(viewModel: AnalyticsViewModel(transactionsList: transactionsViewModel.transactionsList, expenses: transactionsViewModel.expenses, incomes: transactionsViewModel.incomes, updateAction: {
                transactionsViewModel.transactionTypeFilter()
            }))
                .tabItem {
                    VStack{
                        Image(systemName: "chart.pie.fill")
                        Text("Statistics")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
