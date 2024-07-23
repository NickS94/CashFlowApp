//
//  SwipeDeleteButton.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct SwipeDeleteButton: View {
    
    let actionDelete:()->Void
    
    var body: some View {
        Button(role: .destructive) {
            actionDelete()
        } label: {
            VStack{
                Image(systemName: "trash")
                Text("Delete")
            }
        }
    }
}

#Preview {
    SwipeDeleteButton(actionDelete: {})
}
