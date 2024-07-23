//
//  ContentView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct ContentView: View {
    @State private var salary: Double = 1500.0
    var body: some View {
        TabView {
            
            TransactionsView()
                .tabItem {
                    VStack{
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Transactions")
                    }
                }
            
            
            Text("HALLO")
                .tabItem {
                    VStack{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            
        }
    }
}

#Preview {
    ContentView()
}
