//
//  TransactionsView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct TransactionsView: View {
    
    @StateObject var viewModel = TransactionsViewModel ()
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                SummaryHeader {
                    viewModel.getSummary()
                }
                List(viewModel.expensesList){ expense in
                    NavigationLink {
                        TransactionDetailView(detailsViewModel: TransactionsDetailsViewModel(expense:expense))
                    } label: {
                        TransactionsRow(expense: expense)
                    }
                    .swipeActions{
                        SwipeDeleteButton {
                            viewModel.deleteExpense(expense)
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
                viewModel.getData()
            }
            .sheet(isPresented: $viewModel.showSheet) {
                AddNewBudgetSheetView(addNewTransactionViewModel: AddNewTransactionViewModel(expensesList: viewModel.expensesList, updateAction: {
                    viewModel.getData()
                }), showSheet: $viewModel.showSheet, showAlert: $viewModel.showAlert, alertText: $viewModel.alertText)
                    .alert(viewModel.alertText, isPresented: $viewModel.showAlert){}
            }
        }
    }
}


#Preview {
    TransactionsView()
}
