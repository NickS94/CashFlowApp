//
//  BudgetDetailView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct BudgetDetailView: View {
    
    @ObservedObject var detailsViewModel : TransactionsDetailsViewModel

    var body: some View {
        VStack {
            
            if detailsViewModel.isEditing{
                
                DetailsEditingForm(detailsViewModel: detailsViewModel)
                
            }else{
                
                DetailsForm(expense: detailsViewModel.expense)
            }

            Button{
                detailsViewModel.isEditing = true
                
                detailsViewModel.counter += 1
                
                if detailsViewModel.counter == 2{
                    detailsViewModel.updateExpense()
                }
                
            }label: {
                HStack{
                    Text(detailsViewModel.isEditing ? "Save" : "Edit")
                    Image(systemName: detailsViewModel.isEditing ? "checkmark" : "pencil")
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Expense Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
