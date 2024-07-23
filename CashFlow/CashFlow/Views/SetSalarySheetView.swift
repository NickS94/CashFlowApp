//
//  SetSalarySheetView.swift
//  CashFlow
//
//  Created by feras  hababa  on 22.07.24.
//

import SwiftUI

struct SetSalarySheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var salary: Double
    
    @State private var salaryInput: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Set Salary")) {
                    TextField("Salary", text: $salaryInput)
                        .keyboardType(.decimalPad)
                }
                
                Button("Save") {
                    if let newSalary = Double(salaryInput) {
                        salary = newSalary
                        dismiss()
                    }
                }
            }
            .navigationTitle("Set Salary")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            salaryInput = String(salary)
        }
    }
}

#Preview {
    SetSalarySheetView(salary: .constant(2000.0))
}
