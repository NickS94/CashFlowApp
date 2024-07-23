//
//  TransactionsView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct TransactionsView: View {
    @State var expenses = [
        Expense(amount: 20, description: "Groceries", symbol: "cart"),
        Expense(amount: 50, description: "Gas", symbol: "car.fill"),
        Expense(amount: 50, description: "Gas", symbol: "car.fill"),
        Expense(amount: 50, description: "Gas", symbol: "car.fill"),
        Expense(amount: 50, description: "Gas", symbol: "car.fill"),
        Expense(amount: 50, description: "Gas", symbol: "car.fill"),
        Expense(amount: 15, description: "Coffee", symbol: "cup.and.saucer.fill")
    ]
    @State var salary: Double = 1500.0
    @State var showSheet = false
    @State var showSalarySheet = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Remaining Salary:")
                    Spacer()
                    Text("\(salary - expenses.reduce(0) { $0 + $1.amount }, specifier: "%.2f") €")
                }
                .padding()
                HStack {
                    Text("Summary:")
                    Spacer()
                    Text("Total Expenses: \(expenses.reduce(0) { $0 + $1.amount }, specifier: "%.2f") €")
                }
                .padding()
                
                List {
                    ForEach($expenses) { $expense in
                        NavigationLink {
                            BudgetDetailView(expense: $expense)
                        } label: {
                            BudgetRow(expense: $expense)
                        }
                    }
                    .onDelete(perform: deleteExpense)
                }
                
            }
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showSalarySheet = true
                    } label: {
                        Image(systemName: "banknote")
                            .font(.title)
                            .padding(5)
                    }
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding(5)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                AddNewBudgetSheetView(expenses: $expenses, salary: $salary)
            }
            .sheet(isPresented: $showSalarySheet) {
                SetSalarySheetView(salary: $salary)
            }
            .navigationTitle("Transactions")
        }
    }
    
    private func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
}

#Preview {
    TransactionsView()
}
