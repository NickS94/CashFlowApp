//
//  SaveDetailsButton.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct SaveDetailsButton: View {
    
    @Binding var isEditing:Bool
    @Binding var counter:Int
    let actionUpdate:()->Void
    
    var body: some View {
        
        Button{
            isEditing = true
            
            counter += 1
            
            if counter == 2{
                actionUpdate()
            }
            
        }label: {
            HStack{
                Text(isEditing ? "Save" : "Edit")
                Image(systemName:isEditing ? "checkmark" : "pencil")
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    SaveDetailsButton(isEditing: .constant(false), counter: .constant(0), actionUpdate: {})
}
