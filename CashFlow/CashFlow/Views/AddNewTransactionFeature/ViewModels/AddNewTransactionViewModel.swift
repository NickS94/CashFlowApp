//
//  AddNewTransactionViewModel.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation


class AddNewTransactionViewModel:ObservableObject{
    
    
    @Published var title = ""
    @Published var amount = ""
    @Published var symbol = ExpenseSymbols.clothing

    @Published var expensesList:[Expense]
    var updateAction:()-> Void
    
    init(expensesList:[Expense], updateAction: @escaping () -> Void) {

        self.expensesList = expensesList
        self.updateAction = updateAction
        
    }
    
    private let repository = Repository.sharedInstance
    
    
    func addNewExpense() {
        
        do{
            try repository.addExpense(title, Double(amount) ?? 0.0, symbol.rawValue)
            updateAction()
        }catch{
            print(error.localizedDescription)
        }
    }
    

    func emptyFieldsCheck()->Bool{
        return title.isEmpty && amount.isEmpty
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
    
}
