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
                    
                    ForEach(TransactionSymbols.allCases, id: \.self) { symbol in
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
                        .padding(5)
                        .frame(maxWidth: .infinity , maxHeight: 50)
                        .background(.gray.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Image(systemName: "pencil")
                        .font(.title)
                        .foregroundStyle(.gray)
                }
                
            }
            
            Section("Amount") {
                HStack{
                    TextField("Amount" ,text: $detailsViewModel.amount)
                        .font(.title)
                        .keyboardType(.decimalPad)
                        .padding(5)
                        .frame(maxWidth: .infinity , maxHeight: 50)
                        .background(.gray.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Image(systemName: "pencil")
                        .font(.title)
                        .foregroundStyle(.gray)
                }
               
            }
            
            Section("Type") {
                Picker("Transaction Type", selection:$detailsViewModel.transactionType) {
                    ForEach([TransactionTypes.expenses,TransactionTypes.incomes], id: \.rawValue){ type in
                        Text(type.rawValue).tag(type)
                    }
                }
            }
            .pickerStyle(.segmented)
        }
        .scrollContentBackground(.hidden)
    }
}

