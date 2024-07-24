//
//  ContentView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TransactionsView()
                .tabItem {
                    VStack{
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Transactions")
                    }
                }
            
            ProfileView()
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
