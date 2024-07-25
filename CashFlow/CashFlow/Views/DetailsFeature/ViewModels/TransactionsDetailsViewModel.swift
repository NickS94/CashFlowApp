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
    @Published var symbol:TransactionSymbols
    @Published var transactionType:TransactionTypes
    @Published var counter = 0
    
    
    let transaction :TransactionEntity
    
    private let repository = Repository.sharedInstance
    
    
    init(transaction: TransactionEntity) {
        self.transaction = transaction
        self.title = transaction.title ?? ""
        self.amount = String(transaction.amount)
        
        if let transactionType = TransactionTypes(rawValue: transaction.transactionType ?? "") {
            self.transactionType = transactionType
        } else {
            self.transactionType = .all
        }
        
        if let transactionSymbol = TransactionSymbols(rawValue: transaction.symbol ?? "") {
            self.symbol = transactionSymbol
        } else {
            self.symbol = .groceries
        }
    }
    
    
    func updateExpense(){
        do{
            try repository.editExpense(transaction,title,Double(amount) ?? 0,symbol.rawValue ,transactionType.rawValue)
            counter = 0
            isEditing = false
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
