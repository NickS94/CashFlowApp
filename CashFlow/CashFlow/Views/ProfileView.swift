//
//  SetSalarySheetView.swift
//  CashFlow
//
//  Created by feras  hababa  on 22.07.24.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing: 20){
                HStack(spacing:20){
                    Image(systemName: "person")
                        .font(.system(size: 25))
                        .frame(width: 65,height: 65)
                        .background(.gray)
                        .clipShape(Circle())
                    
                    VStack(spacing:5){
                        Text("Person name here")
                            .font(.system(size: 18))
                            .bold()
                        
                        Text("Person email here")
                            .font(.system(size: 18))
                            .bold()
                        
                    }
                }
                
                Text("Here you can describe the percentage of your salary that is spended")
            }
            .padding()
            
            Form{
                ForEach(TransactionSymbols.allCases,id:\.rawValue){ category in
                    NavigationLink {
                        
                    } label: {
                        HStack{
                            Text(category.rawValue)
                            Spacer()
                            
                            Image(systemName: category.symbol)
                                .font(.title)
                                .padding()
                                .background(category.color)
                                .clipShape(Circle())
                                
                        }
                        
                          
                        
                    }
                }
            }
            .navigationTitle("Analytics")
        }
    }
}

#Preview {
    ProfileView()
}
