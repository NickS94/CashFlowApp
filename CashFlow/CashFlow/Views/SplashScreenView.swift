//
//  SplashScreenView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive = false
    @State var opacity = 0.5
    @State var size = 0.6
    
    var body: some View {
        
        if isActive {
            ContentView()
        }else{
            VStack{
                VStack{
                    Image(systemName: "eurosign.circle.fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.yellow)
                    Text("CashFlow")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.monospaced)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                }
            }
        }
       
    }
}

#Preview {
    SplashScreenView()
}
