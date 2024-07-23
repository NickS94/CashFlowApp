//
//  TransactionsViewModel.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation


class TransactionsViewModel:ObservableObject{
    
    @Published var expensesList :[Expense] = []
    
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

    
    func deleteExpense(_ expense :Expense){
        do{
            try repository.deleteExpense(expense)
            getData()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
   
    func getSummary() -> Double{
        
        return expensesList.reduce(0){$0 + $1.amount}
        
    }
    
}
