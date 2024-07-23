//
//  AddNewBudgetSheetView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct AddNewBudgetSheetView: View {
    
    @ObservedObject var addNewTransactionViewModel:AddNewTransactionViewModel
    @Binding var showSheet:Bool
    @Binding var showAlert:Bool
    @Binding var alertText:String
    var body: some View {
        
        NavigationStack{
            Form {
                Section("New Expense") {
                    TextFields(amount: $addNewTransactionViewModel.amount, title: $addNewTransactionViewModel.title)
                }
                Section("Category") {
                    CategoryPicker(symbol: $addNewTransactionViewModel.symbol)
                }
            }
            List(addNewTransactionViewModel.expensesList){ expense in
                TransactionsRow(expense: expense)
                    .onTapGesture {
                        addNewTransactionViewModel.setExistedParameters(expense)
                    }
            }
            .listStyle(.inset)
            .navigationTitle("Add Expense")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    CancelButton (showSheet: $showSheet)
                }
                ToolbarItem(placement:.confirmationAction) {
                    AddNewTransactionButton(checkAction: {
                        addNewTransactionViewModel.emptyFieldsCheck()
                    }, actionAdd: {
                        addNewTransactionViewModel.addNewExpense()
                    }, showSheet: $showSheet, showAlert: $showAlert, alertText: $alertText)
  
                }
            }
        }
    }
}



