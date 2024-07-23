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
                Section(header: Text("New Expense")) {
                    
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
            .navigationTitle("Add Expense")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        viewModel.showSheet = false
                    }
                }
                ToolbarItem {
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
        
        ScrollView{
            ForEach(viewModel.expensesList){ expense in
                TransactionsRow(expense: expense)
                    .onTapGesture {
                        viewModel.setExistedParameters(expense)
                    }
            }
        }
    }
}


#Preview {
    AddNewBudgetSheetView(viewModel: TransactionsViewModel())
}
