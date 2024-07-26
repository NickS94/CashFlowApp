//
//  ExpenseSymbols.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation
import SwiftUI
import Charts


enum TransactionSymbols:String,CaseIterable{
    
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
    case income = "Income"
    
    
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
        case .income:
            return "eurosign.circle"
        }
    }
    
    var color: Color {
        switch self {
        case .groceries:
            return .green
        case .rent:
            return .orange
        case .heatingCosts:
            return .red
        case .electricity:
            return .yellow
        case .insurance:
            return .purple
        case .gym:
            return .blue
        case .autoFuel:
            return .gray
        case .phone:
            return .cyan
        case .internet:
            return .teal
        case .diningOut:
            return .pink
        case .entertainment:
            return .indigo
        case .travel:
            return .mint
        case .healthcare:
            return .green
        case .education:
            return .orange
        case .clothing:
            return .purple
        case .pets:
            return .brown
        case .subscriptions:
            return .red
        case .transportation:
            return .yellow
        case .savings:
            return .green
        case .income:
            return .yellow
        }
    }
}

