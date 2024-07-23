//
//  ExpenseSymbols.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation
import SwiftUI


enum ExpenseSymbols:String,CaseIterable{
    
    case groceries = "Groceries"
    case rent = "Rent"
    case heatingCosts = "Heating Costs"
    case electricity = "Electricity"
    case insurance = "Insurance"
    case gym = "Gym"
    case autoFuel = "Fuel"
    case phone = "Phone"
    case internet = "Internet"
    case diningOut = "Dining Out"
    case entertainment = "Entertainment"
    case travel = "Travel"
    case healthcare = "Healthcare"
    case education = "Education"
    case clothing = "Clothing"
    case pets = "Pets"
    case subscriptions = "Subscriptions"
    case transportation = "Transportation"
    case savings = "Savings"
    
    
    
    var symbol: String {
        switch self {
        case .groceries:
            return "cart.fill"
        case .rent:
            return "house.fill"
        case .heatingCosts:
            return "thermometer"
        case .electricity:
            return "bolt.fill"
        case .insurance:
            return "shield.fill"
        case .gym:
            return "figure.walk"
        case .autoFuel:
            return "fuelpump.fill"
        case .phone:
            return "phone.fill"
        case .internet:
            return "wifi"
        case .diningOut:
            return "fork.knife"
        case .entertainment:
            return "gamecontroller.fill"
        case .travel:
            return "airplane"
        case .healthcare:
            return "heart.fill"
        case .education:
            return "book.fill"
        case .clothing:
            return "tshirt.fill"
        case .pets:
            return "pawprint.fill"
        case .subscriptions:
            return "newspaper.fill"
        case .transportation:
            return "car.fill"
        case .savings:
            return "banknote.fill"
        }
    }
    
    var color:Color{
        switch self{
            
        case .groceries:
                .blue
        case .rent:
                .cyan
        case .heatingCosts:
                .orange
        case .electricity:
                .yellow
        case .insurance:
                .purple
        case .gym:
                .green
        case .autoFuel:
                .gray
        case .phone:
                .green
        case .internet:
                .blue
        case .diningOut:
                .brown
        case .entertainment:
                .blue
        case .travel:
                .cyan
        case .healthcare:
                .green
        case .education:
                .teal
        case .clothing:
                .indigo
        case .pets:
                .brown
        case .subscriptions:
                .red
        case .transportation:
                .yellow
        case .savings:
                .green
        }
    }
}
