//
//  AddNewBudgetSheetView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct AddNewBudgetSheetView: View {
    
    @ObservedObject var viewModel:TransactionsViewModel
    
    var body: some View {
        NavigationStack{
            Form {
                Section("New Expense") {
                    
                    TextField("Amount", text: $viewModel.amount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Description", text: $viewModel.title)
                }
                Section("Category") {
                    Picker("Select a Category", selection: $viewModel.symbol) {
                        ForEach(ExpenseSymbols.allCases, id: \.self) { symbol in
                            HStack {
                                Image(systemName: symbol.symbol)
                                    .font(.title)
                                    .frame(width: 60,height: 60)
                                    .background(symbol.color)
                                    .clipShape(Circle())
                                Text(symbol.rawValue)
                                
                            }
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            
            List(viewModel.expensesList){ expense in
                TransactionsRow(expense: expense)
                    .onTapGesture {
                        viewModel.setExistedParameters(expense)
                    }
            }
            .listStyle(.inset)
            
            .navigationTitle("Add Expense")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button{
                        viewModel.showSheet = false
                    }label: {
                        HStack{
                            Image(systemName: "xmark")
                            Text("Cancel")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                ToolbarItem(placement:.confirmationAction) {
                    Button {
                        viewModel.addNewExpense()
                    }label: {
                        HStack{
                            Text("Save")
                            Image(systemName: "checkmark")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
        }
    }
}



#Preview {
    AddNewBudgetSheetView(viewModel: TransactionsViewModel())
}
