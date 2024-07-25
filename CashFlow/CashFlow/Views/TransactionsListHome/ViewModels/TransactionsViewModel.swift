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
    
    
    private let repository = Repository.sharedInstance
  
    
    func getData(){
        do{
            transactionsList = try repository.fetchTransactions()
        }catch{
            print(error.localizedDescription)
        }
    }

    
    func deleteTransaction(_ transaction :TransactionEntity){
        do{
            try repository.deleteExpense(transaction)
            getData()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
   
    func getExpenseSummary() -> Double{
        
        let expenseList = transactionsList.filter{!$0.isIncome}
        
        return expenseList.reduce(0){$0 + $1.amount}
        
    }
    
    func getIncomeSummary() -> Double{
        
        let incomeList = transactionsList.filter{$0.isIncome}
        let balance = incomeList.reduce(0){$0 + $1.amount} - getExpenseSummary()
        return max(0,balance)
    }
    
}
