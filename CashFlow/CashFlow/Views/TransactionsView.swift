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
                HStack {
                    Text("Remaining Salary:")
                    Spacer()
                    
                }
                .padding()
                HStack {
                    Text("Costs Summary:")
                    Spacer()
                    Text("\(String(format : "%.2f" , viewModel.getSummary()))€")
                }
                .padding()
                
                List(viewModel.expensesList){ expense in
                    NavigationLink {
                        BudgetDetailView(detailsViewModel: TransactionsDetailsViewModel(expense:expense))
                    } label: {
                        TransactionsRow(expense: expense)
                    }
                    .swipeActions{
                        Button(role: .destructive) {
                            viewModel.deleteExpense(expense)
                        } label: {
                            VStack{
                                Image(systemName: "trash")
                                Text("Delete")
                            }
                        }

                    }
                }
                .listStyle(.inset)
            }
            .toolbar {
                ToolbarItem{
                    Button {
                        viewModel.showSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding(5)
                    }
                }
            }
            .navigationTitle("Transactions")
            .onAppear{
                viewModel.getData()
            }
            .sheet(isPresented: $viewModel.showSheet) {
                AddNewBudgetSheetView(viewModel: viewModel)
                    .alert(viewModel.alertText, isPresented: $viewModel.showAlert){}
            }
           
        }
    }
}


#Preview {
    TransactionsView()
}
