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
        
        TextField("Amount", text: $amount)
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
        
        TextField("Description", text: $title)
            .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    TextFields(amount: .constant("0.0"), title: .constant(""))
}
