//
//  Repository.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation


class Repository{
    
    
    static let sharedInstance = Repository()
    
    private let store = PersistentStore.shared
    
    
    func fetchTransactions() throws -> [TransactionEntity]{
        return try store.context.fetch(TransactionEntity.fetchRequest())
    }
    
    func addExpense(_ title:String ,_ amount:Double,_ symbol:String, _ isIncome:Bool) throws {
        
        let newTransaction = TransactionEntity(context: store.context)
        
        newTransaction.id = UUID()
        newTransaction.date = Date.now
        newTransaction.title = title
        newTransaction.amount = amount
        newTransaction.symbol = symbol
        newTransaction.isIncome = isIncome
        
        try store.context.save()
    }
    
    func editExpense (_ transaction:TransactionEntity,_ title:String? = nil,_ amount:Double? = nil,_ symbol:String? = nil,_ isIncome:Bool? = nil) throws{
        
        if let title = title{
            transaction.title = title
        }
        
        if let amount = amount{
            transaction.amount = amount
        }
        
        if let symbol = symbol{
            transaction.symbol = symbol
        }
        
        if let isIncome = isIncome{
            transaction.isIncome = isIncome
        }
        
        try store.context.save()
    }
    
    func deleteExpense(_ transaction:TransactionEntity) throws {

        store.context.delete(transaction)
        
       try store.context.save()
        
    }
    
    
    
}
