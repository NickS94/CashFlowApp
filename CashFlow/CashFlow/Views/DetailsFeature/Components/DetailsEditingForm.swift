//
//  DetailsEditingForm.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct DetailsEditingForm: View {
    
    @ObservedObject var detailsViewModel:TransactionsDetailsViewModel
    
    var body: some View {
        NavigationStack{
            HStack{
                Picker("Select Category", selection: $detailsViewModel.symbol) {
                    
                    ForEach(ExpenseSymbols.allCases, id: \.self) { symbol in
                        HStack {
                            Image(systemName: symbol.symbol)
                                .font(.title)
                                .frame(width: 60,height: 60)
                                .background(symbol.color)
                                .clipShape(Circle())
                            Text(symbol.rawValue)
                            
                        }
                    }
                }
                .pickerStyle(.navigationLink)
            }
        }
        
        Form {
            Section("Description") {
                HStack{
                    TextField("Description",text: $detailsViewModel.title)
                        .font(.title)
                       
                    
                    Image(systemName: "pencil")
                }
                
            }
            
            Section("Amount") {
                HStack{
                    TextField("Amount:" ,text: $detailsViewModel.amount)
                        .font(.title)
                        .keyboardType(.decimalPad)
                       
                    Image(systemName: "pencil")
                }
               
            }
        }
    }
}

