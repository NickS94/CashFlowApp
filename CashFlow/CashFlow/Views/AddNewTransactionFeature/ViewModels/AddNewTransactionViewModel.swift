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
    @Published var symbol = TransactionSymbols.clothing
    @Published var transactionType:TransactionTypes = .incomes
    
    @Published var transactionsList:[TransactionEntity]
    var updateAction:()-> Void
    
    init(transactionsList:[TransactionEntity], updateAction: @escaping () -> Void) {

        self.transactionsList = transactionsList
        self.updateAction = updateAction
        
    }
    
    private let repository = Repository.sharedInstance
    
    
    func addNewExpense() {
        do{
            try repository.addExpense(title, Double(amount) ?? 0.0, symbol.rawValue, transactionType.rawValue)
            updateAction()
        }catch{
            print(error.localizedDescription)
        }
    }
    

    func emptyFieldsCheck()->Bool{
        return title.isEmpty && amount.isEmpty
    }
    
  
    
    func setExistedParameters(_ transaction:TransactionEntity){
        
        title = transaction.title ?? ""
        
        amount = String(transaction.amount)
        
        if let transactionSymbol = TransactionSymbols(rawValue: transaction.symbol ?? "") {
            symbol = transactionSymbol
        } else {
            symbol = .groceries
        }
        
        if let transactionType = TransactionTypes(rawValue: transaction.transactionType ?? "") {
            self.transactionType = transactionType
        }else{
            self.transactionType = .incomes
        }
        
    }
    
}
