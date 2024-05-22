//
//  Activity.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import Foundation
import SwiftData

@Model
class Activity {
    var id: String
    let admin: Admin
    var type: ActivityType
    var date: Date
    var listOfAddedProduct: [AddedProduct]
    
    enum ActivityType: String, CaseIterable, Codable, Hashable, Identifiable {
        case checkIn = "Check-in"
        case checkOut = "Check-out"
        
        var id: String { self.rawValue }
    }
    
    init(admin: Admin, type: ActivityType, listOfAddedProduct: [AddedProduct]) {
        self.id = UUID().uuidString
        self.admin = admin
        self.type = type
        self.date = Date()
        self.listOfAddedProduct = listOfAddedProduct
    }
}

struct AddedProduct: Hashable, Identifiable, Codable {
    var id: String = UUID().uuidString
    var product: ActivityProduct
    var qty: Int
}

func makeDate(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) -> Date {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.second = second
    return Calendar.current.date(from: components) ?? Date()
}

