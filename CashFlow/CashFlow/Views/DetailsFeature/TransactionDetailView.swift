//
//  BudgetDetailView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct TransactionDetailView: View {
    
    @ObservedObject var detailsViewModel : TransactionsDetailsViewModel

    var body: some View {
        
        VStack {
            
            if detailsViewModel.isEditing{
                
                DetailsEditingForm(detailsViewModel: detailsViewModel)
                
            }else{
                
                DetailsForm(transaction: detailsViewModel.transaction)
            }
            SaveDetailsButton(isEditing: $detailsViewModel.isEditing, counter: $detailsViewModel.counter) {
                detailsViewModel.updateExpense()
            }
            
        }
        .padding()
        .navigationTitle("Expense Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
