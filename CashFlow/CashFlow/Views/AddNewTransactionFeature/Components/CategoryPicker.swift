//
//  CategoryPicker.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct CategoryPicker: View {
    @Binding var symbol : TransactionSymbols
    var body: some View {
        
        Picker("Select a Category", selection: $symbol) {
            
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

#Preview {
    CategoryPicker(symbol: .constant(.diningOut))
}
