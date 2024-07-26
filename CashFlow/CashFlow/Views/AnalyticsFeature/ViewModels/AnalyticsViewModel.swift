//
//  AnalyticsViewModel.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 26.07.24.
//

import Foundation


class AnalyticsViewModel:ObservableObject{
    
    @Published var transactionsList:[TransactionEntity]
    @Published var expenses:Double
    @Published var incomes:Double
    @Published var expensesPercentage = 0.0
    var updateAction:()->Void
    
    init(transactionsList: [TransactionEntity], expenses: Double, incomes: Double, updateAction: @escaping () -> Void) {
        self.transactionsList = transactionsList
        self.expenses = expenses
        self.incomes = incomes
        self.updateAction = updateAction
        
      
    }
    
    func getExpenseResultInPercent(){
        expensesPercentage = (expenses / incomes) * 100
        updateAction()
    }
    
    
    
}
