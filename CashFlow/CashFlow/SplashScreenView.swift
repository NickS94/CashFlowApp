//
//  SplashScreenView.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 22.07.24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 0.5
    @State private var size = 2.6
    @State private var rotationAngle: Double = 0.0
    
    var body: some View {
        Group {
            if isActive {
                ContentView()
            } else {
                VStack {
                    VStack {
                        Image(systemName: "eurosign.circle.fill")
                            .font(.system(size: 100))
                            .foregroundStyle(.yellow)
                        Text("CashFlow")
                            .font(.largeTitle)
                            .bold()
                            .fontDesign(.monospaced)
                        Text("The best app for managing your finances 🤑")
                            .font(.title3)
                            .padding(.top, 8)
                            .fontDesign(.monospaced)
                            
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .rotationEffect(.degrees(rotationAngle))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            self.isActive = true
                        }
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                            self.rotationAngle = 360
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    SplashScreenView()
}
