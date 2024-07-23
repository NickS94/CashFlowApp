//
//  AddNewBudgetSheetView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct AddNewBudgetSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var expenses: [Expense]
    @Binding var salary: Double
    
    @State private var amount: String = ""
    @State private var description: String = ""
    @State private var selectedSymbol: String = "cart"
    
    let symbols = ["cart", "car.fill", "cup.and.saucer.fill", "house.fill", "gift.fill"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("New Expense")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    TextField("Description", text: $description)
                    
                    Picker("Select a Symbol", selection: $selectedSymbol) {
                        ForEach(symbols, id: \.self) { symbol in
                            HStack {
                                Image(systemName: symbol)
                            
                            }.tag(symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Button("Add Expense") {
                    if let amount = Double(amount), !description.isEmpty {
                        let newExpense = Expense(amount: amount, description: description, symbol: selectedSymbol)
                        expenses.append(newExpense)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewBudgetSheetView(expenses: .constant([]), salary: .constant(2000.0))
}
