//
//  TransactionsDetailsViewModel.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation



class TransactionsDetailsViewModel:ObservableObject{
    
    @Published var isEditing = false
    @Published var title:String
    @Published var amount:String
    @Published var symbol:ExpenseSymbols
    @Published var counter = 0
    
    
    let expense :Expense
    
    private let repository = Repository.sharedInstance
    
    
    init(expense: Expense) {
        self.expense = expense
        self.title = expense.title ?? ""
        self.amount = String(expense.amount)
        
        if let expenseSymbol = ExpenseSymbols(rawValue: expense.symbol ?? "") {
            self.symbol = expenseSymbol
        } else {
            self.symbol = .groceries
        }
    }
    
    
    func updateExpense(){
        do{
            try repository.editExpense(expense,title,Double(amount) ?? 0,symbol.rawValue)
            counter = 0
            isEditing = false
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
}
