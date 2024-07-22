//
//  BudgetRow.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct BudgetRow: View {
    let number :Double
    var body: some View {
        HStack{
            Image(systemName: "cart")
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(Circle())
               
            VStack(alignment:.leading,spacing: 5){
                Text("Description")
                Text("Date")
            }
            Spacer()
            Text(String(format: "%.2f", number) + "€" )
                .font(.system(size: 22))
                .bold()
        }
        .padding(5)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

#Preview {
    BudgetRow(number: 50.5)
}
