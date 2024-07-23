//
//  CancelButton.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct CancelButton: View {
    
    @Binding var showSheet :Bool
    
    var body: some View {
        Button{
           showSheet = false
        }label: {
            HStack{
                Image(systemName: "xmark")
                Text("Cancel")
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(.red)
    }
}

#Preview {
    CancelButton(showSheet: .constant(false))
}
