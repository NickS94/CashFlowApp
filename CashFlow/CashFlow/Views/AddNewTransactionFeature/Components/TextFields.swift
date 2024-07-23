//
//  TextFields.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct TextFields: View {
    
    @Binding var amount:String
    @Binding var title:String
    var body: some View {
        
        TextField("Description", text: $title)
            .frame(maxWidth: .infinity , maxHeight: 50)
            .textFieldStyle(.roundedBorder)
        
        TextField("Amount", text: $amount)
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
            
      
    }
}

#Preview {
    TextFields(amount: .constant("0.0"), title: .constant(""))
}
