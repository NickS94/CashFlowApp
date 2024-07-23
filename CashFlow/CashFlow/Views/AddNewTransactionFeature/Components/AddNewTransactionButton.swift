//
//  AddNewTransactionButton.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import SwiftUI

struct AddNewTransactionButton: View {

    let checkAction:()->Bool
    let actionAdd:()->Void
    @Binding var showSheet:Bool
    @Binding var showAlert:Bool
    @Binding var alertText:String
    
    var body: some View {
        Button {
            if checkAction(){
                showAlert = true
                alertText = "Please fill the empty fields"
            }else{
                actionAdd()
                showSheet = false
            }

        }label: {
            HStack{
                Text("Save")
                Image(systemName: "checkmark")
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    AddNewTransactionButton(checkAction: {false}, actionAdd: {}, showSheet: .constant(false), showAlert: .constant(false), alertText: .constant(""))
}
