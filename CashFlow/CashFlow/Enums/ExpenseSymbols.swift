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
    
    var color: Color {
        
        switch self {
            
        case .groceries:
                .mintGreen
        case .rent:
                .peach
        case .heatingCosts:
                .burntSienna
        case .electricity:
                .gold
        case .insurance:
                .lavender
        case .gym:
                .seaGreen
        case .autoFuel:
                .slateGray
        case .phone:
                .jade
        case .internet:
                .azure
        case .diningOut:
                .mahogany
        case .entertainment:
                .cerulean
        case .travel:
                .turquoise
        case .healthcare:
                .emerald
        case .education:
                .saffron
        case .clothing:
                .amethyst
        case .pets:
                .umber
        case .subscriptions:
                .crimson
        case .transportation:
                .amber
        case .savings:
                .forestGreen
        }
    }
}

extension Color {
    static let mintGreen = Color(red: 152/255, green: 255/255, blue: 152/255)
    static let peach = Color(red: 255/255, green: 218/255, blue: 185/255)
    static let burntSienna = Color(red: 233/255, green: 116/255, blue: 81/255)
    static let gold = Color(red: 255/215, green: 215/255, blue: 0/255)
    static let lavender = Color(red: 230/255, green: 230/255, blue: 250/255)
    static let seaGreen = Color(red: 46/255, green: 139/255, blue: 87/255)
    static let slateGray = Color(red: 112/255, green: 128/255, blue: 144/255)
    static let jade = Color(red: 0/255, green: 168/255, blue: 107/255)
    static let azure = Color(red: 240/255, green: 255/255, blue: 255/255)
    static let mahogany = Color(red: 192/255, green: 64/255, blue: 0/255)
    static let cerulean = Color(red: 0/255, green: 123/255, blue: 167/255)
    static let turquoise = Color(red: 64/255, green: 224/255, blue: 208/255)
    static let emerald = Color(red: 80/255, green: 200/255, blue: 120/255)
    static let saffron = Color(red: 244/255, green: 196/255, blue: 48/255)
    static let amethyst = Color(red: 153/255, green: 102/255, blue: 204/255)
    static let umber = Color(red: 99/255, green: 81/255, blue: 71/255)
    static let crimson = Color(red: 220/255, green: 20/255, blue: 60/255)
    static let amber = Color(red: 255/255, green: 191/255, blue: 0/255)
    static let forestGreen = Color(red: 34/255, green: 139/255, blue: 34/255)
}
