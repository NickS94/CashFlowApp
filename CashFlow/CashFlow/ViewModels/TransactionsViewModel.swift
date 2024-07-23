//
//  TransactionsViewModel.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation


class TransactionsViewModel:ObservableObject{
    
    @Published var expensesList :[Expense] = []
    @Published var title = ""
    @Published var amount = ""
    @Published var symbol = ExpenseSymbols.clothing
    @Published var showSheet = false
    @Published var showAlert = false
    @Published var alertText = ""
    
    private let repository = Repository.sharedInstance
    
    
    func getData(){
        do{
            expensesList = try repository.fetchExpenses()
        }catch{
            print(error.localizedDescription)
        }
    }

    func addNewExpense() {
        
        if title.isEmpty,amount.isEmpty{
            showAlert = true
            alertText = "Please fill the empty fields"
        }else{
            do{
                try repository.addExpense(title, Double(amount) ?? 0.0, symbol.rawValue)
                getData()
                showSheet = false
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func setExistedParameters(_ expense:Expense){
        
        title = expense.title ?? ""
        
        amount = String(expense.amount)
        
        if let expenseSymbol = ExpenseSymbols(rawValue: expense.symbol ?? "") {
            symbol = expenseSymbol
        } else {
            symbol = .groceries
        }
        
    }
    
    func getSummary() -> Double{
        
        return expensesList.reduce(0){$0 + $1.amount}
        
    }
    
}
