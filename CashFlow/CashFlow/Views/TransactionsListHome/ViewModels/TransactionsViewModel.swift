//
//  TransactionsViewModel.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation


class TransactionsViewModel:ObservableObject{
    
    @Published var transactionsList :[TransactionEntity] = []
    
    @Published var showSheet = false
    @Published var showAlert = false
    @Published var alertText = ""
    @Published var transactionType:TransactionTypes = .all
    @Published var remainingSalary = 0.0
    @Published var expenses = 0.0
    
    
    private let repository = Repository.sharedInstance
  
    
   private func getAllTransactions(){
        do{
            transactionsList = try repository.fetchTransactions()
        }catch{
            print(error.localizedDescription)
        }
    }

    func transactionTypeFilter(){
        
        guard transactionType != .all else{
            getAllTransactions()
            return
        }
        
        do{
            transactionsList = try repository.transactionTypeFilter(transactionType.rawValue)
        }catch{
            print(error.localizedDescription)
        }
    }
  
    func deleteTransaction(_ transaction :TransactionEntity){
        do{
            try repository.deleteExpense(transaction)
            getAllTransactions()
        }catch{
            print(error.localizedDescription)
        }
    }
    

    func getIncomeSummary(){
    
        do{
            let allIncome = try repository.transactionTypeFilter("Incomes")
            
            let allExpenses = try repository.transactionTypeFilter("Expenses")
            
            expenses = allExpenses.reduce(0){$0 + $1.amount}
            
            remainingSalary = allIncome.reduce(0){$0 + $1.amount} - allExpenses.reduce(0){$0 + $1.amount}
            
        }catch{
            print(error.localizedDescription)
            
        }

    }
    
}
