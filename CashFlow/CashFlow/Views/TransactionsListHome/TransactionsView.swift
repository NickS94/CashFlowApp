//
//  TransactionsView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct TransactionsView: View {
    
    @ObservedObject var viewModel :TransactionsViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                SummaryHeader(viewModel: viewModel)
                
                Picker("Filter", selection: $viewModel.transactionType) {
                    ForEach(TransactionTypes.allCases, id:\.rawValue) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                
                
                List(viewModel.transactionsList){ transaction in
                    NavigationLink {
                        TransactionDetailView(detailsViewModel: TransactionsDetailsViewModel(transaction:transaction))
                    } label: {
                        TransactionsRow(transaction:transaction)
                    }
                    .swipeActions{
                        SwipeDeleteButton {
                            viewModel.deleteTransaction(transaction)
                        }
                    }
                }
                .listStyle(.inset)
            }
            .toolbar {
                ToolbarItem{
                    SheetButton(showSheet: $viewModel.showSheet)
                }
                
            }
            .navigationTitle("Transactions")
            .onAppear{
                
                viewModel.transactionTypeFilter()
                
            }
            .onChange(of: viewModel.transactionType) {
                
                viewModel.transactionTypeFilter()
                
            }
            
            .sheet(isPresented: $viewModel.showSheet) {
                AddNewBudgetSheetView(addNewTransactionViewModel: AddNewTransactionViewModel(transactionsList: viewModel.transactionsList, updateAction: {
                    viewModel.transactionTypeFilter()
                }), showSheet: $viewModel.showSheet, showAlert: $viewModel.showAlert, alertText: $viewModel.alertText)
                .alert(viewModel.alertText, isPresented: $viewModel.showAlert){}
            }
        }
    }
}

