//
//  TransactionsView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct TransactionsView: View {
    
    @State var numbersList = [1,2,5,23,56,21,8,99,56]
    @State var showSheet = false
    var body: some View {
        NavigationStack{
            
            VStack(alignment:.leading){
                
                HStack{
                    Text("Summary:")
                    Spacer()
                    Text("\(numbersList.reduce(0){$0 + $1}) €")
                }
                
                List{
                    ForEach(numbersList, id:\.self){ number in
                        NavigationLink{
                            BudgetDetailView()
                        }label: {
                            BudgetRow(number: Double(number))
                        }
                        
                        
                    }
                }
            }
            .toolbar{
                ToolbarItem {
                    Button{
                        showSheet = true
                    }label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding(5)
                    }
                }
            }
            .sheet(isPresented: $showSheet){
                AddNewBudgetSheetView()
            }
            .navigationTitle("Transactions")
            
        }
    }
}


#Preview {
    TransactionsView()
}
