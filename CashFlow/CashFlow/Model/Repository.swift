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
    
    
    func transactionTypeFilter(_ transactionType:String)throws ->[TransactionEntity]{
        
        let request = TransactionEntity.fetchRequest()
        
        request.predicate = NSPredicate(format: "transactionType == %@" ,transactionType)

        return try store.context.fetch(request)
    }
    

    
    func addExpense(_ title:String ,_ amount:Double,_ symbol:String, _ transactionType:String) throws {
        
        let newTransaction = TransactionEntity(context: store.context)
        
        newTransaction.id = UUID()
        newTransaction.date = Date.now
        newTransaction.title = title
        newTransaction.amount = amount
        newTransaction.symbol = symbol
        newTransaction.transactionType = transactionType
        
        try store.context.save()
    }
    
    func editExpense (_ transaction:TransactionEntity,_ title:String? = nil,_ amount:Double? = nil,_ symbol:String? = nil,_ transactionType:String? = nil) throws{
        
        if let title = title{
            transaction.title = title
        }
        
        if let amount = amount{
            transaction.amount = amount
        }
        
        if let symbol = symbol{
            transaction.symbol = symbol
        }
        
        if let transactionType = transactionType{
            transaction.transactionType = transactionType
        }
        
        try store.context.save()
    }
    
    func deleteExpense(_ transaction:TransactionEntity) throws {

        store.context.delete(transaction)
        
       try store.context.save()
        
    }
    
    
    
}
