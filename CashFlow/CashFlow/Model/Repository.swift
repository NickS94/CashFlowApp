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
    
    
    func fetchExpenses() throws ->[Expense]{
        
        return try store.context.fetch(Expense.fetchRequest())
    }
    
    
    func addExpense(_ title:String ,_ amount:Double,_ symbol:String) throws {
        
        let newExpense = Expense(context: store.context)
        
        newExpense.id = UUID()
        newExpense.date = Date.now
        newExpense.title = title
        newExpense.amount = amount
        newExpense.symbol = symbol

        try store.context.save()
    }
    
    
    func editExpense (_ expense:Expense,_ title:String,_ amount:Double,_ symbol:String) throws{
        expense.amount = amount
        expense.title = title
        expense.symbol = symbol
        
        try store.context.save()
    }
    
    
    func deleteExpense(_ expense:Expense) throws {
        
        store.context.delete(expense)
        
        try store.context.save()
        
    }
    
    
    
}
