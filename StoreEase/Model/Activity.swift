//
//  Activity.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import Foundation

struct Activity: Hashable, Identifiable, Codable {
    var id: String = UUID().uuidString
    let admin: Admin
    var type: ActivityType
    var date: Date = Date()
    var listOfAddedProduct: [AddedProduct]
    
    enum ActivityType: String, CaseIterable, Codable, Hashable, Identifiable {
        case checkIn = "Check-in"
        case checkOut = "Check-out"
        
        var id: String { self.rawValue }
    }
}

struct AddedProduct: Hashable, Identifiable, Codable {
    var id: String = UUID().uuidString
    var product: Product
    var qty: Int
    
//    init(id: Int, product: Product, qty: Int) {
//        self.id = UUID().uuidString
//        self.product = product
//        self.qty = qty
//    }
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

var activities:[Activity] = [
    Activity(admin: Admin(username: "Jerry", password: "jejer"), type: .checkIn, date: makeDate(year: 2024, month: 3, day: 23, hour: 12, minute: 43, second: 44 ), listOfAddedProduct: [
        AddedProduct(product: Product(name:"Surya 12", stocks: 4), qty: 5),
        AddedProduct(product: Product(name:"Tali Jagat", stocks: 7), qty: 3)
    ]),
    Activity(admin: Admin(username: "Azewt", password: "azezet"), type: .checkOut, date: Date(), listOfAddedProduct: [
        AddedProduct(product: Product(name:"Djisamsoe", stocks: 2), qty: 1),
        AddedProduct(product: Product(name:"Malboro", stocks: 3), qty: 2)
    ])
]

