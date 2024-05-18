//
//  Activity.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import Foundation

struct Activity: Hashable, Identifiable, Codable {
    var id: Int
    var type: ActivityType
    var date: Date
    var listOfAddedProduct: [AddedProduct]
    
    enum ActivityType: String, CaseIterable, Codable, Hashable, Identifiable {
        case checkIn = "Check-in"
        case checkOut = "Check-out"
        
        var id: String { self.rawValue }
    }
}

struct AddedProduct: Hashable, Identifiable, Codable {
    var id: Int
    var product: Product
    var qty: Int
    
    init(id: Int, product: Product, qty: Int) {
        self.id = id
        self.product = product
        self.qty = qty
    }
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
    Activity(id: 1, type: .checkIn, date: makeDate(year: 2024, month: 3, day: 23, hour: 12, minute: 43, second: 44 ), listOfAddedProduct: [
        AddedProduct(id: 1, product: Product(id:2, name:"Surya 12", stocks: 4), qty: 5),
        AddedProduct(id: 2, product: Product(id:2, name:"Tali Jagat", stocks: 7), qty: 3)
    ]),
    Activity(id: 2, type: .checkOut, date: Date(), listOfAddedProduct: [
        AddedProduct(id: 3, product: Product(id:4, name:"Djisamsoe", stocks: 2), qty: 1),
        AddedProduct(id: 4, product: Product(id:5, name:"Malboro", stocks: 3), qty: 2)
    ])
]

