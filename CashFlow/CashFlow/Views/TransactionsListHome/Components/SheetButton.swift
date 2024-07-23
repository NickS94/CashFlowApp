//
//  SheetButton.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct SheetButton: View {
    @Binding var showSheet:Bool
    var body: some View {
        
        Button {
            showSheet = true
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .padding(5)
        }
    }
}

#Preview {
    SheetButton(showSheet: .constant(false))
}
